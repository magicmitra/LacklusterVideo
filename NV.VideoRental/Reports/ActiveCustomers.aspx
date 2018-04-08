<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActiveCustomers.aspx.cs" Inherits="NV.VideoRental.Reports.ActiveCustomers" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    ACTIVE CUSTOMERS<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="882px">
        <Columns>
            <asp:BoundField DataField="custID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="custID" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="streetAddress" HeaderText="Street Address" SortExpression="streetAddress" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="balance" HeaderText="balance" SortExpression="balance" />
            <asp:BoundField DataField="dvdsOut" HeaderText="DVDs out" SortExpression="dvdsOut" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [customer] WHERE ([active] = @active)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="active" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;
</asp:content>