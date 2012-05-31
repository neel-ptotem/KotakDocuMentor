﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PlayDocumentTest
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PlayDocumentTest</h2>
    

<div class="page-header" style="position:fixed; color:white;font-weight: bold;margin-top: 20px">
  <form action="SaveDocumentResults">
  <% foreach(KotakDocuMentor.Models.FilledSection filled_section in ViewData["filled_sections"] as List<KotakDocuMentor.Models.FilledSection>){ %>
  <input type="hidden" name="<%:filled_section.id %>" id="<%:filled_section.id %>" value="1" />
  <% } %>
  <input type="hidden" name="docucheck_id" id="docucheck_id" value="<%:((KotakDocuMentor.Models.Docucheck)ViewData["docucheck"]).id %>" />
  <input type="hidden" name="sequence_number" id="sequence_number" value="<%: ViewData["sequence_number"] %>" />
  <input type="submit" class="btn-success btn" id ="save_button"/>
  </form>
  <br>
  <br>

  <%foreach(KotakDocuMentor.Models.Document ref_doc in ViewData["reference_documents"] as List<KotakDocuMentor.Models.Document>){%>
  <%: Html.ActionLink("View "+ref_doc.name, "ShowReferenceDocument", new {docket_id=((KotakDocuMentor.Models.Docucheck)ViewData["docucheck"]).docket_id,document_id=ref_doc.id,seq_no=1},new { target="_blank" }) %>
      <br>
      <br>
  <% } %>

  <br/>


  <br/>
</div>

<div class="row" style="text-align: center; background: transparent">
  <div id="DocumentFrame" class="docuframe">
  </div>

  <% foreach (KotakDocuMentor.Models.FilledSection filled_section in ViewData["filled_sections"] as List<KotakDocuMentor.Models.FilledSection>)
     { %>
<%// KotakDocuMentor.Models.DocumentorDBDataContext DocumentorDB = ViewData["DocumentorDB"] as KotakDocuMentor.Models.DocumentorDBDataContext; %>
      <% KotakDocuMentor.Models.BlankSection blank_section = filled_section.BlankSection; %>
      <% KotakDocuMentor.Models.Example example = filled_section.Example; %>
      <% if (example.is_image == true)
         { %>
          <img src="/Content/examples/<%: example.id%>/medium/<%: example.example_image_file_name%>" id="<%:filled_section.id%>" class=" btn-correct option_image" style="position :absolute;z-index:5000;top :<%:blank_section.ypos%>px;left: <%:blank_section.xpos%>px; height:<%:blank_section.height%>px;width:<%:blank_section.width%>px;" alt=""/>
      <% } %>
      <% else
         { %>
          <p class="btn-correct option_image" id="<%= filled_section.id %>"style="position :absolute;z-index:5000;top :<%= blank_section.ypos%>px;left:<%=blank_section.xpos %>px;width:<%=blank_section.width %>px;height:<%=blank_section.height %>px;"><%:example.text_content%></p>
      <% } %>     
      <img src= "/Content/images/images/cross.jpeg" style="position :absolute;z-index:6000;top:<%:blank_section.ypos%>px;left:<%:blank_section.xpos%>px;visibility:hidden;background:transparent" class="<%:filled_section.id%>" height="32px" width="32px" alt="close"/>
      <% } %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">

<script type="text/javascript">

    $(function () {
        $(".option_image").click(function (event) {

            //if the image is marked correct..mark it incorrect
            if ($(this).attr("class").search("btn-correct") != -1) {
                $("." + $(this).attr("id")).css("visibility", "visible");
                $("." + $(this).attr("id")).css("background", "transparent");
                $(this).removeClass("btn-correct");
                //   $(this).css("background","red");
                $("." + $(this).attr("id")).attr("value", 0);

            }

            //if the image is incorrect...mark is correct
            else {
                $(this).addClass("btn-correct");
                $("." + $(this).attr("id")).css("visibility", "hidden");
                //   $(this).css("background","transparent");
                $("." + $(this).attr("id")).attr("value", 1);
            }


        });

    });

</script>

    <style type="text/css">
        .content {
            background: transparent;
        }

        .page-header {
            background: transparent;
            position: fixed;
            left: 25px;
            border: none;
            height: 600px;
            width: 220px;
            overflow: auto;
        }

        .docuframe {
            width: 900px;
            height: 1080px;
            margin: 0px auto;
            padding: 0px;
            background-image: url("/Content/images/blank_forms/<%:((KotakDocuMentor.Models.Page)ViewData["page"]).id %>/medium/<%:((KotakDocuMentor.Models.Page)ViewData["page"]).blank_form_file_name %>");
            background-repeat: no-repeat;
        }

        .component_icon {
            cursor: pointer;
        }

        .selected_icon {
            margin-left: 30px;
        }

        .selectiondiv {
            position: absolute;
            zIndex: 5000;
            border: 1px solid black
        }
    </style>

</asp:Content>
