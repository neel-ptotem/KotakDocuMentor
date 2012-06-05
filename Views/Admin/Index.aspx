<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="cont" style="background: #870c09;">
    <div class="cont1">
        <img src="/Content/images/general/logo.png" alt="coach" width="300" height="300" />
    </div>
    <div class="cont2">
    <h2 style="color:White;">Get Reports :</h2>
        <div class="demo">

           <div id="tabs" >
	            <ul>
		        <li ><center><a style="width:226px;" href="#tabs-1">Employee Report</a></center></li>
		        <li><center><a style="width:226px; " href="#tabs-2">Division Report</a></center></li>
		        <li><center><a style="width:226px;"  href="#tabs-3">Assignment Report</a></center></li>
	            </ul>
          
	        <div id="tabs-1">
            <table border="1px" cellpadding="5px" >
                <tr>
                    <th>Employee Id</th>
                    <th>Name</th>
                    <th>Division</th>
                    <th></th>
                </tr>
                <% foreach (KotakDocuMentor.Models.Employee employee in ViewData["employees"] as List<KotakDocuMentor.Models.Employee>){%>
                    <tr>
                        <td><%= employee.EmpId %></td>
                        <td><%= employee.FirstName+" "+employee.LastName %></td>
                        <td><%= employee.Division %></td>
                        <td><%: Html.ActionLink("Download Report", "GetReport", new { employee_id = employee.UserLoginName })%></td>
                    </tr>
                <% } %>            
            </table>
               
		  
	        </div>
	        <div id="tabs-2">
               <table border="1px" cellpadding="5px" >
                <tr>
                    <th>Division</th>
                    <th></th>
                </tr>
                <% foreach (string division in ViewData["divisions"] as List<string>){%>
                    <tr>
                        <td><%= division %></td>
                        <td><%: Html.ActionLink("Download Report", "GetReport", new { division = division })%></td>
                    </tr>
                <% } %>            
            </table>

		
	        </div>
	        <div id="tabs-3">
		        <table border="1px" cellpadding="5px" >
                <tr>
                    <th>Quiz</th>
                    <th></th>
                </tr>
                <% foreach (KotakDocuMentor.Models.CaseStudy case_study in ViewData["quizzes"] as List<KotakDocuMentor.Models.CaseStudy>){%>
                    <tr>
                        <td><%= case_study.name %></td>
                        <td><%: Html.ActionLink("Download Report", "GetReport", new { quiz_id = case_study.id })%></td>
                    </tr>
                <% } %>
            </table>
	        </div>
           </div>

        </div>
        <br />
        

    <div class="study">
      <h2 style="color:White;">Management</h2>

        <div class="demo">

           <div id="tabs1">
	            <ul>
		        <li><center><a style="width:226px;" href="#tabs-5">Quizzes</a></center></li>&nbsp;
		        <li><center><a style="width:226px;" href="#tabs-6">Case Studies</a></center></li>
                <li><center><a style="width:226px;" href="#tabs-7">Assignments</a></center></li>
                
	            </ul>
          
	        <div id="tabs-5">
                <form method="post" action="" >
                    <b>Name:</b>&nbsp;<input type="text" name="text" id="name" /><br /><br />
                    <b>Isset:</b>&nbsp;<input type="radio" name="set" id="set" value="yes" />yes&nbsp;&nbsp;&nbsp;<input type="radio" name="set" id="set1" value="no" />no<br /><br />
                    <b>Is Offline Quiz:</b>&nbsp;<input type="radio" name="quiz" id="quiz"  value="y" />yes&nbsp;&nbsp;&nbsp;<input type="radio" name="quiz" id="quiz1" value="n" />no<br />
                </form>
	        </div>
	        <div id="tabs-6">
                <% foreach (KotakDocuMentor.Models.CaseStudy case_study in ViewData["quizzes"] as List<KotakDocuMentor.Models.CaseStudy>){%>
                    <tr>
                        <td><%= case_study.name %></td>
                        <td><%: Html.ActionLink("Activate", "GetReport", new { quiz_id = case_study.id })%></td>
                    </tr>
                <% } %>		
	        </div>
            <div id="tabs-7">
            
            </div>
           </div>

        </div>

    </div>
   </div>


   

   </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">
<style type="text/css">
.cont1
{
    width:400px;
    height:400px; 
    float:left; 
    margin-top:40px;  
}
.cont2
{
    width:800px;
    height:800px; 
    float:left;
    margin-top:40px;    
     
}

.cont
{
    width:100%;
    display:inline-block;  
}
#tabb1, #tabb2 ,#tabb3
{ 

float:left;  
width:250px;
height:50px;
border:solid;
background:white;
}
</style>

<script type="text/javascript">
    $(function () {
        $("#tabs ,#tabs1").tabs();
    });
</script>


</asp:Content>
