﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PlayQuiz
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Quiz</h2>
    <form action="SaveQuizData" method='post'>

<input id="quiz_id" type="hidden" name="quiz_id" value="<%=((KotakDocuMentor.Models.Quiz) ViewData["quiz"]).id %>" />

<input id="assignment_id" type="hidden" name="assignment_id" value="<%: ((KotakDocuMentor.Models.Assignment)ViewData["assignment"]).id %>" />
<table class="table table-bordered">
  <%int i = 1; %>
   <% foreach (KeyValuePair<int, KotakDocuMentor.Controllers.TestManagementController.QuestionAnswers> question in (Dictionary<int, KotakDocuMentor.Controllers.TestManagementController.QuestionAnswers>)ViewData["quiz_questions"])
       { %>  
       <tr>
       <td class="blocky"  style="border:solid; border-radius:8px;" ><h4 style="color:white;">Question <%= i %>:</h4></td>
       </tr>
      <tr>
        <td style="font-size: 14px; border:solid; border-radius:8px;">

          <b><%= question.Value.question_content %></b><br/><br />
          <% if (question.Value.has_options)
             { %>
          <% foreach (KotakDocuMentor.Models.AnswerChoice option in question.Value.options as List<KotakDocuMentor.Models.AnswerChoice>)
             { %>
         
        <input type="radio" name="<%:option.question_id%>" value="<%:option.answer_content %>"/><%:option.answer_content%><br/>
        <%}
             } %>
             <%else
             { %>
             <input type="text" name="<%:question.Value.question_id%>"/><br/>
             <%} %>
        </td>        
      </tr>
      <%i = i + 1; %>
  <% } %>
</table><br />
<input type="submit" value="Confirm Answers" class="btn-primary"/>
</form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">
<script type="text/javascript">   

</script>
</asp:Content>
