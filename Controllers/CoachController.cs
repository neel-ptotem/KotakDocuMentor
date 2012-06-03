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
        TheCoachDBDataContext CoachDB = new TheCoachDBDataContext();
        [HttpGet]
        public ActionResult module_content()
        {
            ViewData["body_content"]=CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First().body_content;
            ViewData["script_content"] = CoachDB.Modules.Where(a => a.id.Equals(Request.Params["module_id"])).First().script_content;
            //return View("module_"+Request.Params["module_id"]);
            return View("module_content");
        }

        [HttpGet]
        public ActionResult Documentor()
        {
            ViewData["modules"] = CoachDB.Modules.ToList();
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
