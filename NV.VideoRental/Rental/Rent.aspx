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
                    <h3>Scan/Enter Movie ID or Name</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="txtMovieID" runat="server" />
            </div>
            <div class="col-md-3">
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
    </asp:Panel>
</asp:content>

