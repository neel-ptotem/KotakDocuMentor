using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KotakDocuMentor.Models;

namespace KotakDocuMentor.Controllers
{
    public class PracticeController : Controller
    {
        //
        // GET: /Practice/

        private KotakEmployeeDBDataContext KotakEmployeeDB = new KotakEmployeeDBDataContext();
        private DocumentorDBDataContext DocumentorDB = new DocumentorDBDataContext();

        public struct DocInfo
        {
            public int id;
            public int docket_id;
            public string name;
            public bool pending;
            public int score;
            public int seq_no;
            public int attempts;
            public int docuchek_id;
            public DocInfo(int id_v, int docket_id, string name_v, int score_v, bool pending, int seq_no,int attempts,int docucheck)
            {
                this.id = id_v;
                this.docket_id = docket_id;
                this.name = name_v;
                this.pending = pending;
                this.score = score_v;
                this.seq_no = seq_no;
                this.attempts = attempts;
                this.docuchek_id = docucheck;
            }
        }

        [HttpGet]
        public ActionResult Index()
        {
            Student student = DocumentorDB.Students.Where(s => s.id.Equals(Request.Params["student_id"])).First();
            List<Docket> dockets = DocumentorDB.Dockets.ToList();
            var document_info = new Dictionary<int, DocInfo>();
            foreach (Docket docket in dockets)
            {
                foreach (DocketDocument dd in docket.DocketDocuments.Where(x=>x.reference_document!=true).ToList())
                {
                    List<Assignment> assignments = student.Assignments.Where(a => a.ispractice == true).ToList();
                    int score = 0;
                    int no_of_attempts = 0;
                    bool any_pending = false;
                    int seq_no = 0;
                    int docucheck_id=0;
                    foreach (Assignment assignment in assignments)
                    {
                        List<Docucheck> attempts = assignment.Docuchecks.Where(dchk => dchk.document_id == dd.document_id && dchk.played == true).ToList();
                        score = score + attempts.Sum(attempt => attempt.score ?? 0);
                        no_of_attempts = no_of_attempts + attempts.Count;
                        any_pending = assignment.Docuchecks.Where(dchk => dchk.docket_id==docket.id && dchk.document_id == dd.document_id && dchk.played != true).Count() > 0;
                        seq_no = 0;
                        if (any_pending)
                        {
                            
                            Docucheck pending_docucheck = assignment.Docuchecks.Where(dchk => dchk.docket_id == docket.id && dchk.document_id == dd.document_id && (dchk.played == true||dchk.played==null)).First();
                            seq_no= pending_docucheck.FilledSections.Where(fs => fs.marked_correctly == null).First().BlankSection.Page.sequence_number??1;
                            docucheck_id = pending_docucheck.id;
                        }                        
                    }
                    document_info.Add(dd.document_id, new DocInfo(dd.document_id, dd.docket_id, dd.Document.name, score, any_pending, seq_no,no_of_attempts,docucheck_id));
                }
            }
            ViewData["DocInfo"] = document_info;
            ViewData["student_id"] = student.id;
            return View();
        }

        [HttpGet]
        public ActionResult TakePractice()
        {
            Docket docket = DocumentorDB.Dockets.Where(dkt => dkt.id.Equals(Request.Params["docket_id"])).First();
            Document document = DocumentorDB.Documents.Where(dcmt => dcmt.id.Equals(Request.Params["document_id"])).First();
            Student student=DocumentorDB.Students.Where(std=>std.id.Equals(Request.Params["student_id"])).First();
            CaseStudy case_study=docket.CaseStudyDockets.First().CaseStudy;
            Assignment assignment = new Assignment();
            assignment.case_study_id = case_study.id;
            assignment.student_id = student.id;
            assignment.level_id = DocumentorDB.Levels.First().id;
            assignment.ispractice = true;
            assignment.istest = false;
            assignment.isstarted = true;
            assignment.score = 0;
            DocumentorDB.Assignments.InsertOnSubmit(assignment);
            DocumentorDB.SubmitChanges();
            assignment.create_docuchecks(document.id, docket.id);
            DocumentorDB.SubmitChanges();
            Docucheck docucheck = DocumentorDB.Docuchecks.Where(dchk =>  dchk.docket_id == docket.id && dchk.document_id == document.id && (dchk.played == false || dchk.played == null)).First();
            return RedirectToAction("PracticeDocument", new { docucheck_id = docucheck.id, sequence_number = 1 });
        }

        [HttpGet]
        public ActionResult PracticeDocument()
        {
            Docucheck docucheck = DocumentorDB.Docuchecks.Where(a => a.id == Int32.Parse(Request.Params["docucheck_id"])).First();
            int sequence_number = Int32.Parse(Request.Params["sequence_number"]);
            Docket docket = docucheck.Docket;
            List<Document> reference_documents = docket.DocketDocuments.Where(a => a.reference_document == true).Select(b => b.Document).ToList();
            Document document = docucheck.Document;
            List<Page> pages = document.Pages.ToList();
            Page page = pages.Where(a => a.sequence_number == sequence_number).First();
            List<FilledSection> filled_sections = page.BlankSections.Select(a => a.FilledSections.Where(b => b.docucheck_id == docucheck.id).First()).ToList();
            ViewData["docucheck"] = docucheck;
            ViewData["docket"] = docket;
            ViewData["reference_documents"] = reference_documents;
            ViewData["document"] = document;
            ViewData["pages"] = pages;
            ViewData["page"] = page;
            ViewData["filled_sections"] = filled_sections;
            ViewData["sequence_number"] = sequence_number;
            ViewData["DocumentorDB"] = DocumentorDB;
            return View();            
        }

        [HttpGet]
        public ActionResult SaveDocumentResults()
        {
            Docucheck docucheck = DocumentorDB.Docuchecks.Where(a => a.id == Int32.Parse(Request.Params["docucheck_id"])).First();
            Document document = docucheck.Document;
            Page page = document.Pages.Where(a => a.sequence_number == Int32.Parse(Request.Params["sequence_number"])).First();
            List<FilledSection> filled_sections = docucheck.FilledSections.Where(a => a.BlankSection.page_id == page.id).ToList();
            foreach (FilledSection filled_section in filled_sections)
            {
                filled_section.marked_correctly = Boolean.Parse(Request.Params[filled_section.id.ToString()] == "1" ? "true" : "false");
            }
            docucheck.played = true;
            DocumentorDB.SubmitChanges();
            docucheck.calculate_score();
            if (Int32.Parse(Request.Params["sequence_number"]) < document.Pages.Count)
                return RedirectToAction("PracticeDocument", new { docucheck_id = docucheck.id, sequence_number = Int32.Parse(Request.Params["sequence_number"]) + 1 });
            else
            {
                docucheck.calculate_score();
                return RedirectToAction("Index", new { student_id = docucheck.Assignment.student_id });
            }
        }

        [HttpGet]
        public ActionResult ShowReferenceDocument()
        {

            Docucheck docucheck = DocumentorDB.Docuchecks.Where(a => a.docket_id == Int32.Parse(Request.Params["docket_id"]) && a.document_id == Int32.Parse(Request.Params["document_id"]) && (a.ReferenceSet.correct ?? false)).First();
            Document document = docucheck.Document;
            Page page = document.Pages.Where(a => a.sequence_number == int.Parse(Request.Params["seq_no"])).First();
            List<FilledSection> filled_sections = docucheck.FilledSections.ToList();
            ViewData["docket_id"] = Int32.Parse(Request.Params["docket_id"]);
            ViewData["document_id"] = Int32.Parse(Request.Params["document_id"]);
            ViewData["seq_no"] = int.Parse(Request.Params["seq_no"]) + 1;
            ViewData["filled_sections"] = filled_sections;
            ViewData["page"] = page;
            ViewData["islast"] = document.Pages.Where(a => a.sequence_number > int.Parse(Request.Params["seq_no"])).Count() > 0;
            return View();
        }


    }
}
