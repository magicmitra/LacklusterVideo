<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="NV.VideoRental.Account.Manage" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Users</h2>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-4">
            <h3>Search Username</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:TextBox ID="txtUsername" runat="server" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnGetUser" Text="Find User!" OnClick="btnGetUser_Click" runat="server" />
        </div>
    </div>
    <div class="row" style="padding-top:20px">
        <div class="col-md-12">
            <asp:GridView ID="gvEmployees" runat="server" AllowSorting="True" CssClass="mGrid" 
                HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="empID">
                <Columns>
                    <asp:BoundField DataField="userName" HeaderText="User Name" 
                        SortExpression="userName" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" 
                        SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                        SortExpression="lastName" />
                    <asp:HyperLinkField DataNavigateUrlFields="empID" DataNavigateUrlFormatString="EditUser.aspx?ID={0}" HeaderText=""
                        Text="Edit" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
