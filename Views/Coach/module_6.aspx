﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>module_i</title>

</head>
<body>
<a href="/home/Doclauncher" class="section btn btn-inverse" style="overflow:hidden;margin-top:20px;margin-left: 25px;height:240px;width:390px;border-radius: 20px;">
    <img src="/Content/images/general/family-papers-400.jpg" style="margin-left: 200px;margin-top:-10px;height:270px;width:270px">

    <div style="margin-top: -200px;margin-left: -120px;;color:#ffffff; font-size: 48px;">DocuPedia</div>
    <div style="margin-top: 30px;margin-left: 10px;width:180px;color:white; font-size: 16px;">
    Look through the database of documents to understand the whats and whys of documentation...
    </div>
</a>

<a href="/TestManagement/Documentor?student_id=<%:ViewData["student_id"] %>&isTest=false&isPractice=True" class="section btn btn-warning" style="overflow:hidden;margin-top:20px;margin-left: 25px;height:240px;width:390px;border-radius: 20px;" target="_blank">
    <img src="/Content/images/general/ImportantDocs.jpg" style="margin-left: -240px;margin-top:-10px;height:270px;width:270px">

    <div style="margin-top: -200px;margin-left: 100px;;color:black; font-size: 48px;">DocuMentor</div>
    <div style="margin-top: 30px;margin-left: 240px;;color:black; font-size: 16px;">
    Think you have understood everything we had here? Why don't you put it through some practice...
    </div>
</a>
</body>
</html>



