<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>module_i</title>

        
</head>
<body>
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
        <tr><td>TS duly signed by Credit / Legal</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Instruction to Docs Signed by Legal</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Accepted Sanction Letter (signed & Rubber stamped on all pages) </td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Pricing Sheet</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>PF Confirmation</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Latest Approval mails</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>All documents should be filled completely & dated</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>RCU Report / RCU head approval for FG Business</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Disbursement request letter ( < 5 day old )</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>ROC search report in case of Pvt Ltd - Borrower / Coll. Security owner</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>CIBIL/NCIF report to check ( Except First Group / BBG cases )</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Margin Money receipt available where customer paid directly to dealer . / CA Certificate ( as per SL conditions )</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>

        <tr><th class="header-row" colspan="2">KYC documents with OSV</th></tr>
        <tr><td>Latest self certified copy of partnership deed</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Certified Copy of MOA/AOA - In case of Company</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Latest form 32 filed with ROC  / CA Certified List of Directors- In case of Company</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule V of the last/latest Annual Report as a proof of directorship</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Certified copy of Trust Deed and Resolution - Specific</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>PAN card / Address proof with BCIF Ids</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>

        <tr><th class="header-row" colspan="2">In case of Takeovers</th></tr>
        <tr><td>Joint Letter</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>List of Document</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Over and Above letter</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Latest O/s Balance</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>One Chq of Takeover amt in case of OD takeover and RTGS form alongwith cancelled Chq where RTGS to be done .</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>

        <tr><th class="header-row" colspan="2">Repayment Mode PDC/SI/ECS</th></tr>
        <tr><td><span style="font-weight:bold">In case of PDCs/SPDCs</span></td></tr>
        <tr><td>PDC are crossed as A/c Payee and duly filled</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>PDC favouring " KMBL – Loan a/c <Customer Name ></td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>PDC submission form completely filled and signed</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td><span style="font-weight:bold">In Case of SI / ECS</span></td></tr>
        <tr><td>Debit Mandate / SL Form as per format</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>ECS/SI is duly signed and stamped by issuing bank</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><th class="header-row" colspan="2">Collateral Security Related</th></tr>
        <tr><td>Legal / Title Report</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Valuation Report</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Legal instructions to document / Check list</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Documents are properly numbered and matches with list</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td><span style="font-weight:bold">If Vehicles</span></td></tr>
        <tr><td>Vehicle Number</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>RC</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Insurance</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Valuation</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Form B</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>FC</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>RTO Booklet</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>

        <tr><td><span style="font-weight:bold">If Machineries</span></td></tr>
        <tr><td>Invoices</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Valuation</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Insurance</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><th class="header-row" colspan="2">Legal Documents - duly executed, filled in & Rubber stamped (whereever applicable)</th></tr>
        <tr><td>Master Facility Agreement with schedule</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 1 General</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 2 A OD Facility</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 2 B DF Facility</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 2 C CC Facility</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 2 D PCF facility</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Schedule 2 E Bill Collection/Disc/Purchase Fin</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Letter of Credit Agreement</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Counter Guarantee and Indemnity</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Hypothecation Deed</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Supplemental Deed of Hypothecation</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Power of Attorney - Borrowing.</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Guarantee – Individual</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Guarantee – Corporate</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Demand Promissory note – Fixed /Floating / linked to LIBOR</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Take Delievery Letter</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>TBC undertaking</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>FD appropriation letter</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>General Undertaking</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>End Use Undertaking</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>POA to Mortgage</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Declaration Mortgage</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Property Undertaking</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>MOE/ Registered Mort. Deed / ROM</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Constructive MOE for Enhancement cases</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Sole Proprietorship Letter/SRL</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Parternship Authority Letter</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Board Resolution Borrower Co</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Board Resolution Guarantor Co</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Borrowing Power certificate</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Certificate u/s 372 A</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>HUF declaration </td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>HUF undertaking</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>Loan cum Hyp. Agreement</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>
        <tr><td>KMBL Signatures on legal documents.</td><td><input class="section" type="checkbox" name="predisbursement"/></td></tr>

        </table>
    </div>
    </div>
</div>
</body>
</html>



