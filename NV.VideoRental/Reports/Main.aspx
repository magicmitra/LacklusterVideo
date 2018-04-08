<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NV.VideoRental.Reports.Main" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<nav>
    <ul id="menu">
        <li><a runat="server" href="~/Reports/ActiveCustomers.aspx">Active Customers</a></li>
        <li><a runat="server" href="~/Reports/LateMovies.aspx">Late Movies</a></li>
        <li><a runat="server" href="~/Reports/PopularMovies.aspx">Popular Movies</a></li>
        <li><a runat="server" href="~/Reports/CustomReport.aspx">Custom Report</a></li>
    </ul>
</nav>
   Lorem ipsum Reports Main.
</asp:content>