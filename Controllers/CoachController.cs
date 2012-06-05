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
            if(CoachDB.UserProgresses.Where(a=>a.student_id.Equals(student.id) && a.module_id.Equals(module.id-1) && (a.isComplete==false||a.isComplete==null)).Count()==0)
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
        public void UpdateProgress()
        {
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            Module module = CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First();
            List<UserProgress> user_progress_list = CoachDB.UserProgresses.Where(a => a.module_id == module.id && a.student_id == student.id).ToList();
            foreach (UserProgress user_progress in user_progress_list)
            {
                //user_progress.isComplete = true;
                if (Request.Params[user_progress.resource_no.ToString()] != null)
                {
                    bool resource_progress = Request.Params[user_progress.resource_no.ToString()].Equals("1") || Request.Params[user_progress.resource_no.ToString()].Equals("on");
                    if (resource_progress && user_progress.isComplete != true)
                        user_progress.isComplete = true;
                }
            }
            UserModuleTimeStatistic time_stat = CoachDB.UserModuleTimeStatistics.Where(a => a.student_id == student.id && a.module_id == module.id).First();
            time_stat.time_spend = int.Parse(Request.Params["time_spend"])/60 + time_stat.time_spend ?? 0;
            CoachDB.SubmitChanges();
            
        }

        [HttpGet]
        public string GetProgress()
        {
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            int total_sections = student.UserProgresses.Count;
            int completed_sections = student.UserProgresses.Where(up => up.isComplete == true).Count();
            int progress = completed_sections == 0 ? 0: completed_sections*100/total_sections;
            return progress.ToString()+"%";
        }


        [HttpGet]
        public int GetTotalTime()
        {
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            return student.time_spend;
        }

        [HttpGet]
        public void UpdateTotalTime()
        {
            Student student = CoachDB.Students.Where(a => a.id.Equals(Request.Params["student_id"])).First();
            int time_spend = student.time_spend;
            student.time_spend = time_spend + int.Parse(Request.Params["time_spend"])/60;
            CoachDB.SubmitChanges();
        }





        public ActionResult Index()
        {
            return View();
        }

    }
}
