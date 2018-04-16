<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PopularMovies.aspx.cs" Inherits="NV.VideoRental.Reports.PopularMovies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    Popular Movies<br />
<asp:GridView ID="GridView1" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="videoID" HeaderText="Video ID" SortExpression="videoID" />
        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
        <asp:BoundField DataField="studio" HeaderText="Studio" SortExpression="studio" />
        <asp:BoundField DataField="releaseDate" HeaderText="Release Date" SortExpression="releaseDate" />
        <asp:CheckBoxField DataField="rented" HeaderText="Rented" SortExpression="rented" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [video] WHERE [active] = 1 ORDER BY [rating] DESC"></asp:SqlDataSource>
&nbsp;
</asp:content>