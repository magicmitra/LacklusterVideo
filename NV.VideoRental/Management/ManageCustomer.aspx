<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="NV.VideoRental.Management.ManageCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <nav>
        <ul id="menu">
            <li><a runat="server" href="~/Management/AddCustomer.aspx">Add Customer</a></li>
            <li><a runat="server" href="~/Management/EditCustomer.aspx">Edit Customer</a></li>
            <li><a runat="server" href="~/Management/RemoveCustomer.aspx">Remove Customer</a></li>
        </ul>
    </nav>
</asp:Content>
