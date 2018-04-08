<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompleteRental.aspx.cs" Inherits="NV.VideoRental.Rental.CompleteRental" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Rental Transaction Complete</h2>
    <div class="row" style="padding-top: 50px">
        <div class="col-md-4">
            <b>Total Due: </b>
            <asp:Label ID="lblTotalDue" runat="server" />
        </div>
    </div>
    <div class="row" style="padding-top: 20px">
        <div class="col-md-4">
            <asp:Button ID="btnReturnHome" Text="Done" OnClick="btnReturnHome_Click" runat="server" />
        </div>
    </div>
</asp:Content>
