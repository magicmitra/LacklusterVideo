<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="NV.VideoRental.Management.ManageEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <nav>
        <ul id="menu">
            <li><a runat="server" href="~/Management/AddEmployee.aspx">Add Employee</a></li>
            <li><a runat="server" href="~/Management/EditEmployee.aspx">Edit Employee</a></li>
            <li><a runat="server" href="~/Management/RemoveEmployee.aspx">Remove Employee</a></li>
        </ul>
    </nav>
</asp:Content>