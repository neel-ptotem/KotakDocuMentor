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
