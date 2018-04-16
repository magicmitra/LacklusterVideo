<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NV.VideoRental._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnRent" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Rent Movie" OnClick="btnRent_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnReturn" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Return Movie" OnClick="btnReturn_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnReport" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Reports" OnClick="btnReport_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnManagement" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Management Tools" OnClick="btnManagement_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:Content>
