<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEvents.aspx.cs" Inherits="EventManagement.Event.UpdateEvents" %>

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
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>EventId</td>
            <td><asp:TextBox ID="txtUEventid" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EventName</td>
            <td><asp:TextBox ID="txtUEventName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EventCode</td>
            <td><asp:TextBox ID="txtUEventCode" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EventDate</td>
            <td><asp:TextBox ID="txtUEventDate" runat="server" TextMode="Date"></asp:TextBox></td>
        </tr>
        <tr>
            <td>StartTime</td>
            <td><asp:TextBox ID="txtUstartTime" runat="server" TextMode="Time"></asp:TextBox></td>
        </tr>
        <tr>
            <td>EndTime</td>
            <td><asp:TextBox ID="txtUEndTime" runat="server" TextMode="Time"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><asp:TextBox ID="txtUDescription" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            </td>
        </tr>
    </table>    
    </form>
</body>
</html>
