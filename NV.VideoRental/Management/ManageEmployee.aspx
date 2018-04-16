<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="NV.VideoRental.Management.ManageEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnAddEmployee" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Add Employee" OnClick="btnAddEmployee_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnEditEmployee" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Edit Employee" OnClick="btnEditEmployee_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>