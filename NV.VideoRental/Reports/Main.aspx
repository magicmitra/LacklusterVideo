<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NV.VideoRental.Reports.Main" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnActiveCustomers" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Active Customers" OnClick="btnActiveCustomers_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnLateMovies" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Late Movies" OnClick="btnLateMovies_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <asp:Button ID="btnPopularMovies" CssClass="btn btn-primary btn-block" ForeColor="Black" Text="Popular Movies" OnClick="btnPopularMovies_Click" runat="server" />
        </div>
        <div class="col-md-3"></div>
    </div>
</asp:content>