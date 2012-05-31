<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DocuMentor
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid" style="background: #870c09;">
  <div class="span4">
    <br/>

    <img src="/Content/images/general/logo.png" class="span8"/>
    <img src="/Content/images/general/hourglass.gif" style="margin-top:50px" class="span5"/>

    <div style="margin-top: +350px;margin-left: -100px;color:white;font-size: 18px">
      20:36 Hours <br/> elapsed
      <br/>
      <br/>
      <a href="/TestManagement/Documentor?student_id=<%:ViewData["student_id"] %>&isTest=true&isPractice=false" class="btn btn-warning btn-large">Take the Quiz</a>
    </div>
  </div>
  <div class="span8">
    <div class="slider" style="float:right;margin-bottom:0">
      <ol>
        <li>
          <h2><span>Introduction</span></h2>
          <div>
            <div style="padding:20px;">
              <h3>Hello All</h3>
              <h2>Welcome to The Coach</h2>
              <br>
              <div class="row-fluid btxt" style="height:200px;overflow:auto;padding-right:10px">
               <% Html.RenderPartial("intro");%>   
             </div>
             <div class="row-fluid blocky" style="margin-top:20px;">
              <br/>
              <div class="span3 wbtxt">
                Training Plan 
              </div>
              <div class="span4" style="margin-left:-20px">
                <div class="progress progress-striped progress-warning span4">
                  <div class="bar" style="width: 60%;"></div>
                </div>
              </div>
              <div class="span4 bbtxt" style="margin-left:-20px">
                Progress(60%)
              </div>
            </div>
            <div class="row-fluid">
              <table class="table table-condensed">
                <tr>
                  <th>Objective</th>
                  <th>Time</th>
                </tr>
                <tr>
                  <td>Commercial Operations and RCAD</td>
                  <td>5 hours</td>
                  <td class="complete-check"><i class="icon-check"></span></td>
                </tr>
                <tr>
                  <td>Product Tutorials</td>
                  <td>10 hours</td>
                  <td class="complete-check"><i class="icon-check"></span></td>
                </tr>
                <tr>
                  <td>Checklists</td>
                  <td>10 hour</td>
                  <td class="complete-check"><i class="icon-check"></span></td>
                </tr>
                <tr>
                  <td>Documents Zone</td>
                  <td>25 hours</td>
                  <td class="complete-check hideit"><i class="icon-check"></span></td>
                </tr>
                <tr>
                  <td>Quiz</td>
                  <td>5 hours</td>
                  <td class="complete-check hideit"><i class="icon-check"></span></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </li>
      <li>
        <h2><span>Commercial Operations and RCAD</span></h2>
        <div>
          <span style="position:absolute;top:0; padding:20px; width:50px;font-size:18px;font-weight:bold;">Move your mouse over the circles</span>
          <img src="/Content/images/general/cops.png" style="width:250px;margin-top:155px;margin-left:60px;" />
          <style type="text/css">
          a {
            color:black;
          }
          </style>
          <div>
            <div id='radial_container'>

              <ul class='list'>
                <li class='item'>
                  <div class='my_class' id="llt">
                    <div style="margin-left: 20px;"><br/><br/>Limit<br/> Loading <br/>Team</div>
                    <img src="/Content/images/general/llt.png" height="110" width="110" />
                  </div>
                </li>
                <li class='item'>
                  <div class='my_class' id="clt">
                    <div style="margin-left: 20px;"><br/><br/><br/>Commercial Loans Team</div>
                    <img src="/Content/images/general/knowledge_off.png" height="110" width="110" />
                  </div>
                </li>

                <li class='item'>
                  <div class='my_class' id="dmt">
                    <div style="margin-left: 30px;"><br/><br/><br/>Document Maintenance Team</div>
                    <img src="/Content/images/general/microfinance_off.png" height="110" width="110" />
                  </div>
                </li>

                <li class='item'>
                  <div class='my_class' id="eam">
                    <div style="margin-left: 20px;"><br/><br/><br/>Escrow Accounts Maintenance</div>
                    <img src="/Content/images/general/business-consulting_off.png" height="110" width="110" />
                  </div>
                </li>

                <li class='item'>
                </li>
                <li class='item'>
                </li>
                <li class='item'>
                </li>
                <li class='item'>
                </li>
                <li class='item'>
                </li>
                <li class='item'>
                  <div class='my_class' id="slt">
                    <div><br/><br/><br/>
                      <a href="/Content/html_pages/divisions/SanctionLetterTeam/SanctionLetterTeam.html">Sanction <br> Letter <br> Team</a>
                    </div>
                    <img src="/Content/images/general/technology_off.png" height="110" width="110" /></div>
                  </li>
                  <li class='item'>
                    <div class='my_class' id="dvu">
                      <div><br/><br/><br/>Documentation Verification Unit</div>
                      <img src="/Content/images/general/investment_banking_off.png"  height="110" width="110" />
                    </div>
                  </li>

                </ul>
              </div>
            </div>
          </div>
        </li>

        <li>
          <h2><span>Pre Disbursement Checklist (DVU)</span></h2>
          <div>
            <div style="padding:20px;">
              <div style="padding:40px;">
                <h2>Basics</h2>
                <br>
                Kindly read and mark the checkbox to indicate that you understand it. In case of any doubts, please contact RCAD for clarifications:  
                <br/>
                <br/>
                <div style="height:300px;overflow:auto;">
                  <table class="table condensed-table">
                    <tr>
                      <th class="header-row" colspan="2">Requirements</th>
                    </tr>
                    <tr><td>TS duly signed by Credit / Legal</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Instruction to Docs Signed by Legal</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Accepted Sanction Letter (signed & Rubber stamped on all pages) </td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Pricing Sheet</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>PF Confirmation</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Latest Approval mails</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>All documents should be filled completely & dated</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>RCU Report / RCU head approval for FG Business</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Disbursement request letter ( < 5 day old )</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>ROC search report in case of Pvt Ltd - Borrower / Coll. Security owner</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>CIBIL/NCIF report to check ( Except First Group / BBG cases )</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Margin Money receipt available where customer paid directly to dealer . / CA Certificate ( as per SL conditions )</td><td><input type="checkbox" name="predisbursement"/></td></tr>

                    <tr><th class="header-row" colspan="2">KYC documents with OSV</th></tr>
                    <tr><td>Latest self certified copy of partnership deed</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Certified Copy of MOA/AOA - In case of Company</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Latest form 32 filed with ROC  / CA Certified List of Directors- In case of Company</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule V of the last/latest Annual Report as a proof of directorship</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Certified copy of Trust Deed and Resolution - Specific</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>PAN card / Address proof with BCIF Ids</td><td><input type="checkbox" name="predisbursement"/></td></tr>

                    <tr><th class="header-row" colspan="2">In case of Takeovers</th></tr>
                    <tr><td>Joint Letter</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>List of Document</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Over and Above letter</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Latest O/s Balance</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>One Chq of Takeover amt in case of OD takeover and RTGS form alongwith cancelled Chq where RTGS to be done .</td><td><input type="checkbox" name="predisbursement"/></td></tr>

                    <tr><th class="header-row" colspan="2">Repayment Mode PDC/SI/ECS</th></tr>
                    <tr><td><span style="font-weight:bold">In case of PDCs/SPDCs</span></td></tr>
                    <tr><td>PDC are crossed as A/c Payee and duly filled</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>PDC favouring " KMBL – Loan a/c <Customer Name ></td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>PDC submission form completely filled and signed</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td><span style="font-weight:bold">In Case of SI / ECS</span></td></tr>
                    <tr><td>Debit Mandate / SL Form as per format</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>ECS/SI is duly signed and stamped by issuing bank</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><th class="header-row" colspan="2">Collateral Security Related</th></tr>
                    <tr><td>Legal / Title Report</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Valuation Report</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Legal instructions to document / Check list</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Documents are properly numbered and matches with list</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td><span style="font-weight:bold">If Vehicles</span></td></tr>
                    <tr><td>Vehicle Number</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>RC</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Insurance</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Valuation</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Form B</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>FC</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>RTO Booklet</td><td><input type="checkbox" name="predisbursement"/></td></tr>

                    <tr><td><span style="font-weight:bold">If Machineries</span></td></tr>
                    <tr><td>Invoices</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Valuation</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Insurance</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><th class="header-row" colspan="2">Legal Documents - duly executed, filled in & Rubber stamped (whereever applicable)</th></tr>
                    <tr><td>Master Facility Agreement with schedule</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 1 General</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 2 A OD Facility</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 2 B DF Facility</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 2 C CC Facility</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 2 D PCF facility</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Schedule 2 E Bill Collection/Disc/Purchase Fin</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Letter of Credit Agreement</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Counter Guarantee and Indemnity</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Hypothecation Deed</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Supplemental Deed of Hypothecation</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Power of Attorney - Borrowing.</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Guarantee – Individual</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Guarantee – Corporate</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Demand Promissory note – Fixed /Floating / linked to LIBOR</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Take Delievery Letter</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>TBC undertaking</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>FD appropriation letter</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>General Undertaking</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>End Use Undertaking</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>POA to Mortgage</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Declaration Mortgage</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Property Undertaking</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>MOE/ Registered Mort. Deed / ROM</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Constructive MOE for Enhancement cases</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Sole Proprietorship Letter/SRL</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Parternship Authority Letter</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Board Resolution Borrower Co</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Board Resolution Guarantor Co</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Borrowing Power certificate</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Certificate u/s 372 A</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>HUF declaration </td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>HUF undertaking</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>Loan cum Hyp. Agreement</td><td><input type="checkbox" name="predisbursement"/></td></tr>
                    <tr><td>KMBL Signatures on legal documents.</td><td><input type="checkbox" name="predisbursement"/></td></tr>

                  </table>
                </div>
              </div>
            </div>
          </div>
        </li>


        <li>
          <h2><span>Transactional Checklist for Loans and Advances</span></h2>
          <div>
            <div style="padding:20px;">
              <div style="padding:40px;">
                <h2>Basics</h2>
                <br>
                Kindly read and mark the checkboxes to indicate that you understand the requirements. In case of any doubts, please contact Commercial Operations for clarifications:  
                <br/>
                <br/>
                <div style="height:300px;overflow:auto;">
                  <table class="table condensed-table">
                    <tr><th class='header-row' colspan='2'>Request Letter (RL)</th></tr>
                    <tr><td>RL should be of latest date, it should not be older than 5 days</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Must include Tenure in days/months, Rate in % plus fix/floating option, Amount to be disbursed and Account in which it need to be disbursed. In case of RTGS details of the same</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Signature verification - Person authorised to sign per BR and SV of the same</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>Rate Approval</th></tr>
                    <tr><td>by appropriate authority is in place or not alonwith Rate sheet</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>Board Resolution (BR) </th></tr>
                    <tr><td>BR should be latest and cover the transaction processed otherwise revised BR need to taken</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Name of Authorized Signatory incorporated in BR</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Check signature from system or other legible source like Pan Card, Driving Licence, Passport</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>Limit and DP in place</th></tr>
                    <tr><td>Limit and DP are in place and in case DP or Limit is expired necessary approval for extension is in place</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>DP approval should be from Monitoring team</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>In case of Limit extension,approval should be required as per approval auhtority matrix of the bank</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>Sanction letter (SL)</th></tr>
                    <tr><td>Date of sanction letter - whether it is valid or not, if not extension from appropriate authority is in place. Normally SL is valid of 1year</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Sanction letter should cover the facility requested to be disbursed </td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Please check the terms of sanction letter like</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Repayment - PDC (Note UDC. SPDC to be kept with CAD) or A/c Debit. In case of SI, SI mandate</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Tenure of facilities</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Validity of facilities</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Rate applicable</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Mode of disbursement like to kotak a/c or to other bank a/c via RTGS, NEFT, DD, other mode, or directly to vendor / manufacturer / supplier etc</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>CA Certificate required as per Saction</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Reimbursement or Direct payment</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Or any other conditions as stated in the Disbursement conidtion In the SL/TS</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>any specific condition as stated in SL/TS</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Margin as per sanction terms is in place or not, source CAD or CA cert.</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>DP as per sanction terms is in place or not</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>PO/Bills/Invoice </td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Penal Rate applicable</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Processing Fees as per sanction collected or not. Amount Collected & Date of collection</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Maximum minimum tranche, maximum funding at certain point of time</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Check Moratorium Period and it's treatment</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Mode of Payment - EMI, Equaited Principal, Bullet or Any other</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Check all terms & conditions applicable to disbursement of facility</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>Term Sheet  </th></tr>
                    <tr><td>Term sheet covers the facility to be disbursed and should be latest. Normally SL is valid for 1year</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>It should be signed </td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>It termsheet covers more than one facility of same nature - say two STL, It should be confirmed under which facility disbursal is requested.</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>check whether conditions applicable for facility are complied or not. </td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>check for internal conditions in term sheet which are not mentioned in sanction letter.</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>PDC</th></tr>
                    <tr><td>should be favoring KMBL only Party Name or A/c No on it is not acceptable</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>should be properly dated except in case of UDC/SPDC</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>should be A/c payee only and all blanks to be crossed via horizontal line</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Amount in words and figures match</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>PDC of Cooperative Bank - Not Acceptable</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>CA Certificate</th></tr>
                    <tr><td>favouring KMBL preferred generally</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>should support reimbursement / disbursement as per sanction terms</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>should contain membership no. and seal and signature and should be on letter head</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Should contain the contents/format as per sanction.</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><th class='header-row' colspan='2'>PSL/CRE/LOB</th></tr>
                    <tr><td>Please provide confirmation from RCH for CRE/Non CRE</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>Confirmation of PSL category</td><td><input type='checkbox' name='loan-po'/></td></tr>
                    <tr><td>LOB to be tagged</td><td><input type='checkbox' name='loan-po'/></td></tr>

                  </table>
                </div>
              </div>
            </div>
          </div>
        </li>

        <li>
          <h2><span>Product Tutorials</span></h2>
          <div>
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

                  <li><a href="#"><img src="/Content/images/pimg/mediumterm.jpeg" alt="image02" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/bridge.jpeg" alt="image03" /></a></li>
                  <li><a href="/Content/html_pages/products/ShortTermLoan/ShortTermLoan.html"><img src="/Content/images/pimg/stl.jpeg" alt="image01" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/droplineod.jpeg" alt="image05" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/fcy.jpg" alt="image06" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/portfolio.jpeg" alt="image07" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/gateway.jpg" alt="image08" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/lease.jpg" alt="image09" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/overdraft.jpeg" alt="image10" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/pofinance.jpg" alt="image11" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/commodity.jpeg" alt="image04" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/project.jpeg" alt="image12" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/promofunding.jpeg" alt="image13" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/trade.jpeg" alt="image14" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/wcdl.jpeg" alt="image15" /></a></li>
                  <li><a href="#"><img src="/Content/images/pimg/wctl.jpeg" alt="image16" /></a></li>
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
                  </div>
                </li>

                <li>
                  <h2><span>Document Tutorials</span></h2>

                  <div>

                    <a href="/home/Doclauncher" class="btn btn-inverse" style="overflow:hidden;margin-top:20px;margin-left: 25px;height:240px;width:390px;border-radius: 20px;">
                      <img src="/Content/images/general/family-papers-400.jpg" style="margin-left: 200px;margin-top:-10px;height:270px;width:270px">

                      <div style="margin-top: -200px;margin-left: -120px;;color:#ffffff; font-size: 48px;">DocuPedia</div>
                      <div style="margin-top: 30px;margin-left: 10px;width:180px;color:white; font-size: 16px;">
                        Look through the database of documents to understand the whats and whys of documentation...
                      </div>
                    </a>

                    <a href="/TestManagement/Documentor?student_id=<%:ViewData["student_id"] %>&isTest=false&isPractice=True" class="btn btn-warning" style="overflow:hidden;margin-top:20px;margin-left: 25px;height:240px;width:390px;border-radius: 20px;" target="_blank">
                      <img src="/Content/images/general/ImportantDocs.jpg" style="margin-left: -240px;margin-top:-10px;height:270px;width:270px">

                      <div style="margin-top: -200px;margin-left: 100px;;color:black; font-size: 48px;">DocuMentor</div>
                      <div style="margin-top: 30px;margin-left: 240px;;color:black; font-size: 16px;">
                        Think you have understood everything we had here? Why don't you put it through some practice...
                      </div>
                    </a>

                  </div>
                </li>
              </ol>
            </div>
          </div>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">

    <script type="text/javascript" src="/Scripts/javascripts/exclusions/jquery.easing.1.3.js" language="javascript"></script>
    <script type="text/javascript" src="/Scripts/javascripts/exclusions/jQuery.radmenu.js" language="javascript"></script>
    <script type="text/javascript" src="/Scripts/javascripts/exclusions/liteaccordion.jquery.min.js" language="javascript"></script>
    <script type="text/javascript" src="/Scripts/javascripts/exclusions/svgvml.js" language="javascript"></script>
    <script type="text/javascript" src="/Scripts/javascripts/exclusions/jquery.gridnav.js" language="javascript"></script>
    <link href="/Scripts/stylesheets/liteaccordion.css" rel="stylesheet" type="text/css" />
    <link href="/Scripts/stylesheets/gridNavigation.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
    $(function () {
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

        $('.slider').liteAccordion({
            containerWidth: 720, // fixed (px)
            containerHeight: 580, // fixed (px)
            headerWidth: 40, // fixed (px)

            activateOn: 'click', // click or mouseover
            firstSlide: 1, // displays slide (n) on page load
            slideSpeed: 300, // slide animation speed
            onTriggerSlide: function () {
            }, // callback on slide activate
            onSlideAnimComplete: function () {
            }, // callback on slide anim complete

            autoPlay: false, // automatically cycle through slides
            pauseOnHover: false, // pause on hover
            cycleSpeed: 6000, // time between slide cycles
            easing: 'swing', // custom easing function

            theme: 'basic', // basic, dark, light, or stitch
            rounded: true, // square or rounded corners
            enumerateSlides: false, // put numbers on slides
            linkable: false                        // link slides via hash
        });

        $("#radial_container").radmenu({
            listClass: 'list', // the list class to look within for items
            itemClass: 'item', // the items - NOTE: the HTML inside the item is copied into the menu item
            radius: 200, // radius in pixels
            animSpeed: 400, // animation speed in millis
            centerX: -330, // the center x axis offset
            centerY: -250, // the center y axis offset
            selectEvent: "click", // the select event (click)
            onSelect: function ($selected) { // show what is returned
                var themodalname = '#' + $selected.children(":first").attr("id") + '-modal';
                $(themodalname).modal('show');
            },
            angleOffset: 0 // in degrees
        });

        $("#radial_container").radmenu("show")

        $('.my_class').hover(
  function () {
      $(this).children(":last").hide();
      $(this).children(":first").show();
  },
  function () {
      $(this).children(":first").hide();
      $(this).children(":last").show();

  });

    });
</script>

</asp:Content>




