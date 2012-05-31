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
        [HttpGet]
        public ActionResult Index()
        {
            ViewData["emp_id"] =Request.Params["employee_id"];
            return View();
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
