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
        public ActionResult Index()
        {
            if (Request.Params["student_id"] != null)
            {
                string student_username=Request.Params["student_id"];
                Student student;
                if (DocumentorDB.Students.Where(a => a.username.Equals(student_username)).Count() > 0)
                {
                    student= DocumentorDB.Students.Where(a => a.username.Equals(student_username)).First();
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
                    student = DocumentorDB.Students.Where(a => a.username.Equals(student_username)).First();
                    student.create_progress_tracker();
                }
                Session["student_id"] = "Indraneel More";
                ViewData["modules"] = DocumentorDB.Modules.ToList();
                ViewData["student_id"] = student.id;
                ViewData["student_username"] = student_username;
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
