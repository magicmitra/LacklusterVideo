<%@ Page Language="C#" MasterPageFile="~/Site.Master"AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NV.VideoRental.Rental.Main" %>

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
</asp:content>
