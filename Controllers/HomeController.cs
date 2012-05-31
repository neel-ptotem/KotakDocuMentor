using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KotakDocuMentor.Models;

namespace KotakDocuMentor.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        DocumentorDBDataContext DocumentorDB = new DocumentorDBDataContext();
        KotakEmployeeDBDataContext KotakEmployeeDB = new KotakEmployeeDBDataContext();

        [HttpGet]
        public ActionResult Documentor()
        {
            return View();
        }

        

        [HttpGet]
        public ActionResult Index()
        {
            if (Request.Params["student_id"] != null)// && Request.Params["isTest"] != null && Request.Params["isPractice"] != null)
            {
                int student_id;

                string student_username=Request.Params["student_id"];
                if (DocumentorDB.Students.Where(a => a.username.Equals(student_username)).Count() > 0)
                {
                    student_id = DocumentorDB.Students.Where(a => a.username.Equals(student_username)).First().id;
                }
                else
                {
                    Student new_student = new Student();
                    Employee employee=KotakEmployeeDB.Employees.Where(a=>a.UserLoginName.Equals(student_username)).First();
                    new_student.username = employee.UserLoginName;
                    new_student.unique_id = employee.ID;
                    new_student.time_spend = 0;
                    new_student.first_visit = DateTime.Now;
                    DocumentorDB.Students.InsertOnSubmit(new_student);
                    DocumentorDB.SubmitChanges();
                    student_id = DocumentorDB.Students.Where(a => a.username.Equals(student_username)).First().id;
                }
                //bool istest = bool.Parse(Request.Params["istest"]);
                //bool ispractice = bool.Parse(Request.Params["ispractice"]);
                //Assignment assignment;
                ////If assignment exists
                //if (DocumentorDB.Assignments.Where(a => a.student_id == student_id && a.ispractice.Equals(istest) && a.istest.Equals(ispractice) && a.iscomplete !=true).ToList().Count != 0)
                //    assignment = DocumentorDB.Assignments.Where(a => a.student_id == student_id && a.ispractice.Equals(istest) && a.istest.Equals(ispractice) && a.iscomplete !=true).First();
                //else //If assignment doesn't exists
                //{
                //    Assignment a_new = new Assignment();
                //    a_new.student_id = student_id;
                //    List<CaseStudy> case_studies;
                //    if (istest)
                //        case_studies = DocumentorDB.CaseStudies.Where(cs => cs.CaseStudyDockets.Count > 0 && cs.CaseStudyQuizs.Where(csq => csq.Quiz.isonline == true).Count() > 0).ToList();
                //    else if (ispractice)
                //        case_studies = DocumentorDB.CaseStudies.Where(cs => cs.CaseStudyDockets.Count > 0).ToList();
                //    else
                //    {
                //        case_studies = DocumentorDB.CaseStudies.Where(cs => cs.CaseStudyQuizs.Count() > 0).ToList();
                //        //case_studies = DocumentorDB.CaseStudies.Where(cs => cs.CaseStudyQuizs.Where(csq => csq.Quiz.isonline == false).Count() > 0).ToList();
                //    }
                //    Random r_no = new Random();
                //    int new_case_study = r_no.Next(case_studies.Count);
                //    a_new.case_study_id = case_studies[new_case_study].id;
                //    DocumentorDB.Assignments.InsertOnSubmit(a_new);
                //    DocumentorDB.SubmitChanges();
                //    assignment = DocumentorDB.Assignments.Where(a => a.student_id == student_id && a.ispractice.Equals(istest) && a.istest.Equals(ispractice) && a.iscomplete != true).First();
                //    assignment.create_quiz();
                //    assignment.create_docuchecks();
                //}
                //if (istest)
                //    return RedirectToAction("PlayQuiz", new { assignment_id = assignment.id });
                //else if (ispractice)
                //    return RedirectToAction("ListDockets", new { assignment_id = assignment.id });
                //else
                //    return RedirectToAction("PlayQuiz", new { assignment_id = assignment.id });
                ViewData["student_id"] = student_id;
                return View();
            }
            else
            {
                return View("Error");
            }
        }

        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Doclauncher()
        {
            ViewData["documents"] = DocumentorDB.Documents.ToList();
            if (Request.Params["id"] != null)
            {

            }
            return View();
        }
    }
}
