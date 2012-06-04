using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KotakDocuMentor.Models;

namespace KotakDocuMentor.Controllers
{
    public class CoachController : Controller
    {
        DocumentorDBDataContext CoachDB = new DocumentorDBDataContext();
        [HttpGet]
        public ActionResult module_content()
        {
            //ViewData["body_content"]=CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First().body_content;
            //ViewData["script_content"] = CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First().script_content;
            Module module = CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First();
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            ViewData["module_id"] = module.id;
            ViewData["student_id"] = student.id;
            ViewData["progress_tracker"] = CoachDB.UserProgresses.Where(a => a.student_id == student.id && a.module_id == module.id).ToList();
            if(Request.Params["student_id"]=="3")
                return View("module_"+Request.Params["module_id"]);
            else
                return View("module_content");
        }

        [HttpGet]
        public ActionResult Documentor()
        {
            Session["student_id"] = "Indraneel More";
            ViewData["modules"] = CoachDB.Modules.ToList();
            ViewData["student_id"] = Request.Params["student_id"];
            return View();
        }

        [HttpGet]
        public void UserProgress()
        {
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            Module module = CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First();
            List<UserProgress> user_progress_list = CoachDB.UserProgresses.Where(a => a.module_id == module.id && a.student_id == student.id).ToList();
            foreach (UserProgress user_progress in user_progress_list)
            {
                //user_progress.isComplete = true;
                if (Request.Params[user_progress.resource_no.ToString()].Contains("1") && user_progress.isComplete != true)
                    user_progress.isComplete = true;                
            }
            CoachDB.SubmitChanges();
            
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
