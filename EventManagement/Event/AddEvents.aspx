<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEvents.aspx.cs" Inherits="EventManagement.Event.AddEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        </style>
</head>
<script src="../Scripts/jquery-3.7.0.min.js"></script>
  <script src="../Scripts/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#<%= txtEventCode.ClientID %>').on('keypress', function (e) {
            var key = e.which || e.keyCode;
            var keyChar = String.fromCharCode(key);
            var regex = /^[a-zA-Z0-9]$/;

            if (!regex.test(keyChar)) {
                $('#errorMsg').show();   // show error
                return false;
            } else {
                $('#errorMsg').hide();   // hide error
                return true;
            }
        });
    });
</script>

<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
       <h2 align="center">Create Events</h2>
        <tr>
            <td>EventName</td>
            
            <td><asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEventName" ErrorMessage="EventName is Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>EventCode</td>
            <td><asp:TextBox ID="txtEventCode" runat="server" onkeypress="return "></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEventCode" ErrorMessage="Event Code Is Required"></asp:RequiredFieldValidator>
                <span id="errorMsg" style="color:red; display:none;">Only letters and numbers are allowed.</span>
            </td>
        </tr>
        <tr>
            <td>EventDate</td>
            <td><asp:TextBox ID="txtEventDate" runat="server" TextMode="Date"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="rfvEventDate" runat="server" ControlToValidate="txtEventDate"></asp:RequiredFieldValidator>
        </tr>
        <tr>
            <td>StartTime</td>
            <td><asp:TextBox ID="txtStartTime" runat="server" TextMode="Time"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EndTime</td>
            <td><asp:TextBox ID="txtEndTime" runat="server" TextMode="Time"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></td>
        </tr>
        <tr >
            <td colspan="2" align="center">
                <asp:Button ID="btnAdd" runat="server" Text="Create" OnClick="btnAdd_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
