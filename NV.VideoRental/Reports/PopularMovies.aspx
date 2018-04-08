<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PopularMovies.aspx.cs" Inherits="NV.VideoRental.Reports.PopularMovies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    Popular Movies<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="videoID" HeaderText="Video ID" SortExpression="videoID" />
        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
        <asp:BoundField DataField="studio" HeaderText="Studio" SortExpression="studio" />
        <asp:BoundField DataField="released" HeaderText="Released" SortExpression="released" />
        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
        <asp:BoundField DataField="sound" HeaderText="Sound" SortExpression="sound" />
        <asp:BoundField DataField="versions" HeaderText="Versions" SortExpression="versions" />
        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
        <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
        <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
        <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
        <asp:BoundField DataField="aspect" HeaderText="Aspect" SortExpression="aspect" />
        <asp:BoundField DataField="UPC" HeaderText="UPC" SortExpression="UPC" />
        <asp:BoundField DataField="releaseDate" HeaderText="Release Date" SortExpression="releaseDate" />
        <asp:CheckBoxField DataField="active" HeaderText="Active" SortExpression="active" />
        <asp:CheckBoxField DataField="rented" HeaderText="Rented" SortExpression="rented" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [video] ORDER BY [rating] DESC"></asp:SqlDataSource>
&nbsp;
</asp:content>