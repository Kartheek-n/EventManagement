<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="EventManagement.Event.EventList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2 align="center"> Event Details</h2>
        <div>
            <asp:GridView ID="EventGrid1"
                runat="server" 
                AutoGenerateColumns="false"
                DataKeyNames="EventId"
                OnRowCommand="GridEvent_RowCommand"
                OnRowDataBound="GrideEvent_RowDataBound"
               
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EventId" HeaderText="EventId" />
                    <asp:BoundField  DataField="EventName"  HeaderText="EventName" />
                    <asp:BoundField   DataField="EventCode" HeaderText="EventCode" />
                    <asp:BoundField   DataField="EventDate" HeaderText="EventDate" />
                    <asp:BoundField  DataField="StartTime" HeaderText="StartTime" />
                    <asp:BoundField   DataField="EndTime" HeaderText="EndTime" />
                    <asp:BoundField  DataField="Description" HeaderText="Description" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkbtnUpdate" runat="server" Text="Update" CommandName="Edit" CommandArgument='<%#Eval("EventId") %>'></asp:LinkButton>
                            <asp:LinkButton ID="linkbtnDelete" runat="server" Text="Delete"  CommandName="CustomDelete" CommandArgument='<%#Eval("EventId") %>' OnClientClick="return confirm('Are you sure you want to delete this event?');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
              
            </asp:GridView>
        </div>
    </form>
</body>
</html>
