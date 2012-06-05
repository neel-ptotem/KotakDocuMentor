using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.OleDb;
using System.Data;
using System.IO;
using KotakDocuMentor.Models;

namespace KotakDocuMentor.Controllers
{
    [Authorize(Users="IPC\\ImNeel")]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        private DocumentorDBDataContext DocumentorDB = new DocumentorDBDataContext();
        private KotakEmployeeDBDataContext KotakEmployeeDB = new KotakEmployeeDBDataContext();

        public ActionResult Index()
        {
            List<Student> students = DocumentorDB.Students.ToList();
            List<Employee> employees = new List<Employee>();
            foreach (Student student in students)
                employees.Add(KotakEmployeeDB.Employees.Where(e => e.UserLoginName.Equals(student.username)).First());
            List<string> divisions = employees.Select(e => e.Division).Distinct().ToList();
            List<CaseStudy> quizzes = DocumentorDB.CaseStudies.ToList();
            ViewData["divisions"] = divisions;
            ViewData["employees"] = employees;
            ViewData["quizzes"] = quizzes;
            return View();
        }



        [HttpGet]
        public void GetReport()
        {
            List<Student> students=new List<Student>();
            List<CaseStudy> case_studies=new List<CaseStudy>();
            DataTable dt = new DataTable();
            string file_name="Report";

            
            if (Request.Params["employee_id"] != null)
            {
                students.Add(DocumentorDB.Students.Where(a=>a.username.Equals(Request.Params["employee_id"])).First());
                case_studies.AddRange(DocumentorDB.CaseStudies.Where(a => a.CaseStudyDockets.Count > 0).ToList());

                file_name = KotakEmployeeDB.Employees.Where(a => a.UserLoginName.Equals(students.First().username)).Select(b => b.FirstName + " " + b.LastName).First()+DateTime.Now.ToShortDateString();

                dt.Columns.Add("Name of the User", typeof(string));
                dt.Columns.Add("Employee Details", typeof(string));
                dt.Columns.Add("Division", typeof(string));
                dt.Columns.Add("Date of first access to the module", typeof(DateTime));
                dt.Columns.Add("No. of hrs on learning", typeof(int));
                foreach(CaseStudy case_study in case_studies)
                    dt.Columns.Add(case_study.name, typeof(string));
                dt.Columns.Add("Aggregate", typeof(string));
                dt.Columns.Add("No. of tests attempted", typeof(int));
                dt.Columns.Add("No. of tests to go", typeof(int));

                foreach (Student student in students)
                {
                    DataRow new_row = dt.NewRow();
                    new_row[0] = KotakEmployeeDB.Employees.Where(a => a.UserLoginName.Equals(student.username)).Select(b => b.FirstName + " " + b.LastName).First();
                    new_row[1] = KotakEmployeeDB.Employees.Where(a => a.UserLoginName.Equals(student.username)).Select(b => b.EmpId).First();
                    new_row[2] = KotakEmployeeDB.Employees.Where(a => a.UserLoginName.Equals(student.username)).Select(b => b.Division).First();
                    new_row[3] = students.First().first_visit ?? DateTime.Now;
                    new_row[4] = students.First().time_spend / 60;
                    int index=5;
                    int total_score=0;
                    foreach (CaseStudy case_study in case_studies)
                    {
                        int score = 0;
                        student.Assignments.Where(a => a.case_study_id.Equals(case_study.id) && a.iscomplete == true).Select(a=>score=score+a.get_final_score());
                        if (student.Assignments.Where(a => a.case_study_id.Equals(case_study.id) && a.iscomplete == true).Count() > 0)
                            new_row[index] = (score / student.Assignments.Where(a => a.case_study_id.Equals(case_study.id) && a.iscomplete == true).Count()).ToString() + "%";
                        else
                            new_row[index] = "NA";
                        index = index + 1;
                        total_score=total_score+score;
                    }

                    int total_case_studies = DocumentorDB.CaseStudies.Count();
                    if (student.Assignments.Where(a => a.iscomplete == true).Count() > 0)
                        new_row[index] = ((int)(total_score / student.Assignments.Where(a => a.iscomplete == true).Count())).ToString() + "%";
                    else
                        new_row[index] = "NA";
                    int case_studies_attempted = DocumentorDB.CaseStudies.Where(a => a.Assignments.Where(b => b.student_id.Equals(students.First().id) && b.iscomplete != true).Count() > 0).Count();
                    new_row[index+1] = case_studies_attempted;
                    new_row[index + 2] = total_case_studies - case_studies_attempted;
                    dt.Rows.Add(new_row);
                }
                
            }
            else if (Request.Params["division"] != null)
            {
                List<string> division_employees = KotakEmployeeDB.Employees.Where(a => a.Division.Equals(Request.Params["division"])).Select(a => a.UserLoginName).ToList();
                students.AddRange(DocumentorDB.Students.Where(a => division_employees.Contains(a.username)).ToList());
                case_studies.AddRange(DocumentorDB.CaseStudies.Where(a => a.CaseStudyDockets.Count > 0).ToList());
            }
            else if (Request.Params["quiz_id"] != null)
            {
                students.AddRange(DocumentorDB.Students.ToList());
                case_studies.Add(DocumentorDB.CaseStudies.Where(a => a.id.Equals(Request.Params["quiz_id"])).First());
            }
            else if (Request.Params["level_id"] != null)
            {
                students.AddRange(DocumentorDB.Students.ToList());
                case_studies.Add(DocumentorDB.CaseStudies.Where(a => a.id.Equals(Request.Params["level_id"])).First());
            }

            StringWriter sw = new StringWriter();
            
            sw.WriteLine(string.Join("\t", dt.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray()));

            for (int i = 0; i < 100; i++)
                foreach (DataRow row in dt.Rows)
                    sw.WriteLine(string.Join("\t", row.ItemArray));            
            Response.Clear();
            Response.ClearHeaders();
            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment; filename="+file_name+".txt");
            Response.ContentType = "text";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");
            Response.Write(sw);
            Response.End();
            Response.Flush();        
            
        }

        [HttpGet]
        public ActionResult NewQuiz()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateQuiz(HttpPostedFileBase uploadFile)
        {
            string s = Request.Params["level_id"];
            string filePath;
            if (uploadFile.ContentLength > 0)
            {
                filePath = Path.Combine(HttpContext.Server.MapPath("../Uploads"),
                                               Path.GetFileName(uploadFile.FileName));
                uploadFile.SaveAs(filePath);
                //return View();
                string prjdir = (System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().CodeBase));
                prjdir = prjdir.Substring(6, prjdir.LastIndexOf('\\') - (1 + prjdir.Length - prjdir.LastIndexOf('\\')));
                string Excel_conn_string = "Provider=Microsoft.Jet.OleDb.4.0; data source=" + filePath + "; Extended Properties=Excel 8.0;";
                string row_conn_string = "SELECT * FROM [abc$]";
                OleDbConnection Excel_conn = new OleDbConnection(Excel_conn_string);
                OleDbCommand row_cmd = new OleDbCommand(row_conn_string, Excel_conn);
                try
                {
                    Quiz new_quiz = new Quiz();
                    new_quiz.isonline = bool.Parse(Request.Params["isonline"]);
                    new_quiz.level_id = int.Parse(Request.Params["level_id"]);
                    DocumentorDB.Quizs.InsertOnSubmit(new_quiz);
                    DocumentorDB.SubmitChanges();
                    Excel_conn.Open();
                    OleDbDataReader row = row_cmd.ExecuteReader();
                    while (row.Read())
                    {
                        int no_of_cols = row.FieldCount;
                        Question new_question = new Question();
                        new_question.question_content = row.GetValue(0).ToString();
                        int question_type = int.Parse(row.GetValue(2).ToString());
                        new_question.question_type_id = question_type;
                        DocumentorDB.Questions.InsertOnSubmit(new_question);
                        DocumentorDB.SubmitChanges();
                        QuizQuestion new_quiz_question = new QuizQuestion();
                        new_quiz_question.quiz_id = new_quiz.id;
                        new_quiz_question.question_id = new_question.id;
                        DocumentorDB.QuizQuestions.InsertOnSubmit(new_quiz_question);
                        DocumentorDB.SubmitChanges();
                        int no_of_options = 0;
                        if (question_type == 1)
                            no_of_options = 4;
                        else if (question_type == 3)
                            no_of_options = 2;
                        if (question_type == 1 || question_type == 3)
                        {
                            string all_options = "ABCD";
                            bool[] correct_options = { false, false, false, false };
                            int offset = 3;
                            for (int i = 0; i < no_of_options; i++)
                            {
                                AnswerChoice new_answer_choice = new AnswerChoice();
                                new_answer_choice.answer_content = row.GetValue(i + offset).ToString();
                                new_answer_choice.correct = all_options.ElementAt(i).ToString().Equals(row.GetValue(7).ToString());
                                new_answer_choice.question_id = new_question.id;
                                DocumentorDB.AnswerChoices.InsertOnSubmit(new_answer_choice);
                            }
                            DocumentorDB.SubmitChanges();
                        }
                        else if (question_type == 2)
                        {
                            AnswerChoice new_answer_choice = new AnswerChoice();
                            new_answer_choice.answer_content = row.GetValue(8).ToString();
                            new_answer_choice.correct = true;
                            new_answer_choice.question_id = new_question.id;
                            DocumentorDB.AnswerChoices.InsertOnSubmit(new_answer_choice);
                            DocumentorDB.SubmitChanges();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally
                {
                    Excel_conn.Dispose();
                }
            }
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


    }
}
