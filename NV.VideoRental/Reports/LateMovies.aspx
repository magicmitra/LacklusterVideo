<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LateMovies.aspx.cs" Inherits="NV.VideoRental.Reports.LateMovies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
Late Movies<br />
<asp:GridView ID="GridView1" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
    <Columns>
        <asp:BoundField DataField="videoID" HeaderText="Video ID" SortExpression="videoID" />
        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
        <asp:BoundField DataField="studio" HeaderText="Studio" SortExpression="studio" />
        <asp:BoundField DataField="releaseDate" HeaderText="Release Date" SortExpression="releaseDate" />
        <asp:CheckBoxField DataField="rented" HeaderText="Rented" SortExpression="rented" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT v.* FROM [video] [v] JOIN [rental] [r] ON [v].[videoID] = [r].[videoID] WHERE [v].[active] = 1 AND [v].[rented] = 1 AND [r].[dayDue]<GETDATE()"></asp:SqlDataSource>
&nbsp;</asp:content>
