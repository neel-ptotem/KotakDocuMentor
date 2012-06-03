<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>module_i</title>

    <script type="text/javascript">
        $('#tj_container').gridnav({
            rows: 4,
            type: {
                mode: 'sequpdown',  // use def | fade | seqfade | updown | sequpdown | showhide | disperse | rows
                speed: 400,      // for fade, seqfade, updown, sequpdown, showhide, disperse, rows
                easing: '',     // for fade, seqfade, updown, sequpdown, showhide, disperse, rows 
                factor: 50,     // for seqfade, sequpdown, rows
                reverse: false     // for sequpdown
            }
        });

    
  </script>
</head>
<body>
<br/>
<br/>
<h1 style="margin-left:50px;color:black;">The Product Tutorials</h1>  
<br/>
<div class="tj_nav">
    <span id="tj_next" class="tj_next">Next</span>
</div>
<div id="tj_container" class="tj_container">
    <div class="tj_wrapper">
    <ul class="tj_gallery" style="list-style:none">

        <li><a class="section" href="#"><img src="/Content/images/pimg/mediumterm.jpeg" alt="image02" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/bridge.jpeg" alt="image03" /></a></li>
        <li><a class="section" href="/Content/html_pages/products/ShortTermLoan/ShortTermLoan.html"><img src="/Content/images/pimg/stl.jpeg" alt="image01" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/droplineod.jpeg" alt="image05" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/fcy.jpg" alt="image06" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/portfolio.jpeg" alt="image07" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/gateway.jpg" alt="image08" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/lease.jpg" alt="image09" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/overdraft.jpeg" alt="image10" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/pofinance.jpg" alt="image11" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/commodity.jpeg" alt="image04" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/project.jpeg" alt="image12" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/promofunding.jpeg" alt="image13" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/trade.jpeg" alt="image14" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/wcdl.jpeg" alt="image15" /></a></li>
        <li><a class="section" href="#"><img src="/Content/images/pimg/wctl.jpeg" alt="image16" /></a></li>
    </ul>
    </div>
</div>

<!-- <div id="product-menu"> 
    <a href="/assets/products/ShortTermLoan/ShortTermLoan.html">Short Term Loan</a> 
    <a href="/">Long Term Loan</a> 
    <a href="/">Project Loan</a> 
    <a href="/">Bridge Loan</a> 
    <a href="/">Working Capital Term Loan</a> 
    <a href="/">Working Capital Demand Loan</a> 
    <a href="/">Purchase Order Financing</a> 
    <a href="/">CC/Overdraft</a> 
    <a href="/">Commodity Funding</a> 
    <a href="/">Promoter Funding</a> 
    <a href="/">Portfolio Buyouts</a> 
    <a href="/">Lease Rental Discounting</a> 
    <a href="/">Foreign Currency Term Loan</a> 
    <a href="/">Drop Line Overdraft</a> 
    <a href="/">Single Payment Gateway</a> 
    <a href="/">Trade Advance</a> 
-->
<!-- </div>  -->

</body>
</html>



