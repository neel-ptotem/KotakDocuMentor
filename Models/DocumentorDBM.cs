using System;
using System.Collections.Generic;
using System.Linq;
namespace KotakDocuMentor.Models
{

    partial class Docucheck
    {
        private DocumentorDBDataContext DocumentorDBM = new DocumentorDBDataContext();
        public void create_filled_section()
        {

            if (this.FilledSections.Count == 0)
            {
                Document document = this.Document;
                Assignment assignment = this.Assignment;
                CaseStudy case_study = assignment.CaseStudy;
                List<Page> pages = document.Pages.ToList();
                List<BlankSection> blank_sections = new List<BlankSection>();
                foreach (Page page in pages)
                {
                    blank_sections.AddRange(page.BlankSections);
                }
                foreach (BlankSection blank_section in blank_sections)
                {

                    FilledSection filled_section = new FilledSection();
                    filled_section.docucheck_id = this.id;
                    filled_section.blank_section_id = blank_section.id;
                    Component component = blank_section.Component;

                    //if the document is a reference document,everything should be correct

                    ReferenceSet reference_set;
                    if (DocumentorDBM.DocketDocuments.Where(a => a.docket_id == this.docket_id && a.document_id == this.document_id).First().reference_document ?? false)
                    {
                        reference_set = this.ReferenceSet;
                        filled_section.has_no_error = true;
                    }
                    else
                    {
                        Random r_id = new Random();
                        int new_no = r_id.Next(100);
                        //decide what reference set to use
                        if (new_no>50)
                            reference_set = this.ReferenceSet;
                        else
                            reference_set=this.Docket.SuperSet.ReferenceSets.Where(a=>a.id!=this.reference_set_id).ToArray()[r_id.Next(this.Docket.SuperSet.ReferenceSets.ToList().Count-1)];                        
                        if (reference_set.correct!=true && reference_set.id!=this.reference_set_id)
                        {
                            
                            reference_set = this.Docket.SuperSet.ReferenceSets.Where(a => a.id != this.reference_set_id).ToList()[r_id.Next(this.Docket.SuperSet.ReferenceSets.Count - 1)];
                            filled_section.has_no_error = false;
                        }

                    }
                    List<Example> examples = DocumentorDBM.Examples.Where(a => a.reference_set_id == reference_set.id && a.component_id == component.id).ToList();
                    Example example;
                    if (examples.Count==0)
                    {
                        example = DocumentorDBM.Examples.Where(a => a.reference_set_id == this.Docket.SuperSet.ReferenceSets.Where(b => b.name == "blank_set").First().id && a.component_id == component.id).First();
                        filled_section.has_no_error = false;
                    }
                    else
                    {
                        example = examples.First();
                    }
                    filled_section.example_id = example.id;
                    DocumentorDBM.FilledSections.InsertOnSubmit(filled_section);
                    DocumentorDBM.SubmitChanges();
                }
            }
        }

        public void calculate_score()
        {
            int score = this.score??0;
            foreach (FilledSection filled_section in this.FilledSections)
            {
                if (filled_section.has_no_error == filled_section.marked_correctly)
                    score++;
            }
            this.score = score*100/this.FilledSections.Count;
            DocumentorDBM.SubmitChanges();
        }

    }



    partial class Assignment
    {
        private DocumentorDBDataContext DocumentorDBM=new DocumentorDBDataContext();


        public int get_max_docucheck_score()
        {
            return this.Docuchecks.Select(a => a.FilledSections.ToList()).Count();
        }

        public int get_max_quiz_score()
        {
            return this.CaseStudy.CaseStudyQuizs.First().Quiz.QuizQuestions.Count;
        }

        public int get_obtained_docucheck_score()
        {
            int obtained_score = 0;
            foreach (Docucheck dchk in this.Docuchecks)
            {
                foreach (FilledSection filled_section in dchk.FilledSections)
                {
                    if (filled_section.has_no_error == filled_section.marked_correctly)
                        obtained_score = obtained_score + 1;                   
                }                
            }
            return obtained_score;
        }

        public int get_obtained_quiz_score()
        {   
            int quiz_score=0;
            foreach (Response r in this.Responses.ToList())
            {
                if (r.Question.AnswerChoices.Where(b=>b.correct==true).Select(a => a.answer_content).Contains(r.response_content))
                    quiz_score = quiz_score + 1;
            }
            return quiz_score;
        }

        public int get_final_score()
        {
            int obtained_score = this.get_obtained_docucheck_score() + this.get_obtained_quiz_score();
            int maximum_score = this.get_max_docucheck_score() + this.get_max_quiz_score();
            return obtained_score / maximum_score;
        }

        public void create_quiz()
        {
            //CaseStudy case_study = DocumentorDBM.CaseStudies.Where(a => a.id == this.case_study_id).First();
            //List<CaseStudyProduct> case_study_products = case_study.CaseStudyProducts.ToList();
            //List<Product> products = new List<Product>();
            //List<Concept> concepts = new List<Concept>();
            //List<Question> questions = new List<Question>();
            //foreach (CaseStudyProduct csp in case_study_products)
            //{
            //    products.Add(csp.Product);
            //    foreach (ConceptProduct cp in csp.Product.ConceptProducts.ToList())
            //    {
            //        concepts.Add(cp.Concept);
            //        questions.AddRange(cp.Concept.Questions.ToList());
            //    }
            //}

            //Quiz quiz = new Quiz();
            //quiz.assignment_id = this.id;
            //quiz.qcount = questions.Count;
            //quiz.score = 0;
            //quiz.played = false;
            //DocumentorDBM.Quizs.InsertOnSubmit(quiz);
            //DocumentorDBM.SubmitChanges();
            //foreach (Question question in questions)
            //{

            //    QuizQuestion quiz_question = new QuizQuestion();
            //    quiz_question.quiz_id = quiz.id;
            //    quiz_question.question_id = question.id;
            //    DocumentorDBM.QuizQuestions.InsertOnSubmit(quiz_question);
            //}
            //DocumentorDBM.SubmitChanges();
        }

        public void create_docuchecks()
        {
            CaseStudy case_study = DocumentorDBM.CaseStudies.Where(a => a.id == this.case_study_id).First();
            List<CaseStudyDocket> case_study_dockets = case_study.CaseStudyDockets.ToList();
            List<Docket> dockets = new List<Docket>();
            List<Document> documents = new List<Document>();
            foreach (CaseStudyDocket csd in case_study_dockets)
            {
                dockets.Add(csd.Docket);
            }
            foreach (Docket d in dockets)
            {
                foreach (DocketDocument dd in d.DocketDocuments.ToList())
                {
                    Docucheck dchk = new Docucheck();
                    dchk.assignment_id = this.id;
                    dchk.document_id = dd.document_id;
                    dchk.docket_id = dd.docket_id;
                    List<ReferenceSet> reference_sets = d.SuperSet.ReferenceSets.ToList();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                    if (reference_sets.Count(a => a.correct == true) != 0)
                    {
                        Random r_id = new Random();
                        dchk.reference_set_id = reference_sets[r_id.Next(reference_sets.Count)].id;
                    }
                    else
                    {
                        dchk.reference_set_id = reference_sets.First().id;
                    }
                    DocumentorDBM.Docuchecks.InsertOnSubmit(dchk);
                    DocumentorDBM.SubmitChanges();
                    dchk.create_filled_section();
                    
                }                
            }
        }
    }
}
