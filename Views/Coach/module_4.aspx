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
    Kindly read and mark the checkboxes to indicate that you understand the requirements. In case of any doubts, please contact Commercial Operations for clarifications:  
    <br/>
    <br/>
    <div style="height:300px;overflow:auto;">
        <table class="table condensed-table">
        <tr><th class='header-row' colspan='2'>Request Letter (RL)</th></tr>
        <tr><td>RL should be of latest date, it should not be older than 5 days</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Must include Tenure in days/months, Rate in % plus fix/floating option, Amount to be disbursed and Account in which it need to be disbursed. In case of RTGS details of the same</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Signature verification - Person authorised to sign per BR and SV of the same</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>Rate Approval</th></tr>
        <tr><td>by appropriate authority is in place or not alonwith Rate sheet</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>Board Resolution (BR) </th></tr>
        <tr><td>BR should be latest and cover the transaction processed otherwise revised BR need to taken</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Name of Authorized Signatory incorporated in BR</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Check signature from system or other legible source like Pan Card, Driving Licence, Passport</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>Limit and DP in place</th></tr>
        <tr><td>Limit and DP are in place and in case DP or Limit is expired necessary approval for extension is in place</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>DP approval should be from Monitoring team</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>In case of Limit extension,approval should be required as per approval auhtority matrix of the bank</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>Sanction letter (SL)</th></tr>
        <tr><td>Date of sanction letter - whether it is valid or not, if not extension from appropriate authority is in place. Normally SL is valid of 1year</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Sanction letter should cover the facility requested to be disbursed </td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Please check the terms of sanction letter like</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Repayment - PDC (Note UDC. SPDC to be kept with CAD) or A/c Debit. In case of SI, SI mandate</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Tenure of facilities</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Validity of facilities</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Rate applicable</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Mode of disbursement like to kotak a/c or to other bank a/c via RTGS, NEFT, DD, other mode, or directly to vendor / manufacturer / supplier etc</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>CA Certificate required as per Saction</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Reimbursement or Direct payment</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Or any other conditions as stated in the Disbursement conidtion In the SL/TS</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>any specific condition as stated in SL/TS</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Margin as per sanction terms is in place or not, source CAD or CA cert.</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>DP as per sanction terms is in place or not</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>PO/Bills/Invoice </td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Penal Rate applicable</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Processing Fees as per sanction collected or not. Amount Collected & Date of collection</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Maximum minimum tranche, maximum funding at certain point of time</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Check Moratorium Period and it's treatment</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Mode of Payment - EMI, Equaited Principal, Bullet or Any other</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Check all terms & conditions applicable to disbursement of facility</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>Term Sheet  </th></tr>
        <tr><td>Term sheet covers the facility to be disbursed and should be latest. Normally SL is valid for 1year</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>It should be signed </td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>It termsheet covers more than one facility of same nature - say two STL, It should be confirmed under which facility disbursal is requested.</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>check whether conditions applicable for facility are complied or not. </td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>check for internal conditions in term sheet which are not mentioned in sanction letter.</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>PDC</th></tr>
        <tr><td>should be favoring KMBL only Party Name or A/c No on it is not acceptable</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>should be properly dated except in case of UDC/SPDC</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>should be A/c payee only and all blanks to be crossed via horizontal line</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Amount in words and figures match</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>PDC of Cooperative Bank - Not Acceptable</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>CA Certificate</th></tr>
        <tr><td>favouring KMBL preferred generally</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>should support reimbursement / disbursement as per sanction terms</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>should contain membership no. and seal and signature and should be on letter head</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Should contain the contents/format as per sanction.</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><th class='header-row' colspan='2'>PSL/CRE/LOB</th></tr>
        <tr><td>Please provide confirmation from RCH for CRE/Non CRE</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>Confirmation of PSL category</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>
        <tr><td>LOB to be tagged</td><td><input class="section" type="checkbox" name='loan-po'/></td></tr>

        </table>
    </div>
    </div>
</div>
</body>
</html>



