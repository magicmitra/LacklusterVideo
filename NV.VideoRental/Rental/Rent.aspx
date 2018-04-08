<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="NV.VideoRental.Rental.Rent" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Rent a Movie</h2>
    <asp:Panel ID="pnlSelectCustomer" Visible="true" runat="server">
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Scan Customer ID/Enter Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCustomerInfo" runat="server" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" Text="Find!" OnClick="btnGetCustomer_Click" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top:20px">
                <div class="col-md-12">
                    <asp:GridView ID="gvCustomers" runat="server" AllowSorting="True" CssClass="mGrid" 
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="custID">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="custID" DataNavigateUrlFormatString="Rent.aspx?ID={0}" HeaderText="Customer ID"
                                DataTextField="custID" />
                            <asp:BoundField DataField="firstName" HeaderText="First Name" 
                                SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                                SortExpression="lastName" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
    </asp:Panel>
    <asp:Panel ID="pnlMovies" Visible="true" runat="server">
        <div class="row" style="padding-top: 25px;">
            <div class="col-md-4">
<<<<<<< HEAD
                <b>Customer ID: </b>
                <asp:Label ID="lblCustomerID" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 10px;">
            <div class="col-md-4">
                <b>Customer Name: </b>
                <asp:Label ID="lblCustomerName" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 10px;">
            <div class="col-md-4">
                <b>Current Balance: </b>
                <asp:Label ID="lblBalance" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 50px;">
            <div class="col-md-4">
=======
>>>>>>> 09f44574a441a377f57292ab13b587dd8171e463
                    <h3>Scan/Enter Movie ID or Name</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="txtMovieID" runat="server" />
            </div>
            <div class="col-md-3">
<<<<<<< HEAD
                <asp:Button ID="btnFindMovie" Text="Find Movie" OnClick="btnFindMovie_Click" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-4">
                    <h3>Available Movies</h3>
            </div>
        </div>
        <div class="row" style="padding-top:10px">
                <div class="col-md-12">
                    <asp:GridView ID="gvMovies" runat="server" AllowSorting="False" CssClass="mGrid" OnRowCommand="GridView1_RowCommand"
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="videoID"
                        ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:BoundField DataField="videoID" HeaderText="Video ID" 
                                SortExpression="Video ID" />
                            <asp:BoundField DataField="UPC" HeaderText="UPC" 
                                SortExpression="UPC" />
                            <asp:BoundField DataField="Title" HeaderText="Title" 
                                SortExpression="Title" />
                            <asp:BoundField DataField="Studio" HeaderText="Studio" 
                                SortExpression="Studio" />
                            <asp:BoundField DataField="Year" HeaderText="Year" 
                                SortExpression="Year" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="Rent" runat="server" CommandName="Select" CommandArgument='<%#Eval("videoID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
        </div>
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-4">
                    <h3>Customer's Rented Movies</h3>
            </div>
        </div>
        <div class="row" style="padding-top:10px">
                <div class="col-md-12">
                    <asp:GridView ID="gvRented" runat="server" AllowSorting="False" CssClass="mGrid" ShowHeaderWhenEmpty="True"
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="videoID">
                        <Columns>
                            <asp:BoundField DataField="videoID" HeaderText="Video ID" 
                                SortExpression="Video ID" />
                            <asp:BoundField DataField="UPC" HeaderText="UPC" 
                                SortExpression="UPC" />
                            <asp:BoundField DataField="Title" HeaderText="Title" 
                                SortExpression="Title" />
                            <asp:BoundField DataField="dayDue" HeaderText="Due Date" DataFormatString="{0:d}" 
                                SortExpression="dayDue" />
                        </Columns>
                    </asp:GridView>
                </div>
        </div>
        <div class="row" style="padding-top: 80px">
            <div class="col-md-10">

            </div>
            <div class="col-md-2">
                    <b>TOTAL:</b>
                    <asp:Label ID="lblTotal" Text="$0.00" runat="server" />
                    <asp:HiddenField ID="hfTotal" Value="0" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 15px">
            <div class="col-md-10">

            </div>
            <div class="col-md-2">
                <asp:Button ID="btnComplete" Text="View Receipt" OnClick="btnComplete_Click" ValidateRequestMode="Enabled" runat="server" /> 
            </div>
        </div>
=======
                <asp:Button ID="btnFindMovie" Text="Add Movie" OnClick="btnFindMovie_Click" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top:20px">
                <div class="col-md-12">
                    <asp:GridView ID="gvMovies" runat="server" AllowSorting="True" CssClass="mGrid" 
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="custID">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="custID" DataNavigateUrlFormatString="Rent.aspx?ID={0}" HeaderText="Customer ID"
                                DataTextField="videoID" />
                            <asp:BoundField DataField="firstName" HeaderText="First Name" 
                                SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                                SortExpression="lastName" />
                        </Columns>
                    </asp:GridView>
                </div>
        </div>    
>>>>>>> 09f44574a441a377f57292ab13b587dd8171e463
    </asp:Panel>
</asp:content>

