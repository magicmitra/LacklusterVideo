<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="NV.VideoRental.Management.ManageCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnAddCustomer" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Add Customer" OnClick="btnAddCustomer_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnEditCustomer" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Edit Customer" OnClick="btnEditCustomer_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>
