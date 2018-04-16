<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NV.VideoRental.Management.Main" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnManageCustomer" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Manage Customers" OnClick="btnCustomer_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnManageUser" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Manage Employees" OnClick="btnEmployee_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnUploadMovies" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Upload Movies" OnClick="btnUploadMovies_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:content>
