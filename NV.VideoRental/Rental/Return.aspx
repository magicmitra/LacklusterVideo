<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Return.aspx.cs" Inherits="NV.VideoRental.Rental.Return" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <h2>Return Movie</h2>
   <div class="row" style="padding-top: 20px;">
            <div class="col-md-12">
                    <asp:Label ID="lblMessage" Font-Bold="true" Font-Size="Medium" ForeColor="DarkGreen" runat="server" />
            </div>
   </div>
   <div class="row" style="padding-top: 50px;">
            <div class="col-md-4">
                    <h3>Scan/Enter Movie ID or Name</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox ID="txtMovieID" runat="server" />
            </div>
            <div class="col-md-3">
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
                <asp:GridView ID="gvMovies" runat="server" AllowSorting="False" CssClass="mGrid" OnRowCommand="gvMovies_RowCommand"
                    HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="videoID"
                    ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:BoundField DataField="videoID" HeaderText="Video ID" 
                            SortExpression="Video ID" />
                        <asp:BoundField DataField="custID" HeaderText="Customer ID" 
                            SortExpression="custID" />
                        <asp:BoundField DataField="UPC" HeaderText="UPC" 
                            SortExpression="UPC" />
                        <asp:BoundField DataField="Title" HeaderText="Title" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="dayDue" HeaderText="Date Due" 
                            SortExpression="dayDue" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button Text="Return" runat="server" CommandName="Select" CommandArgument='<%#Eval("videoID")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
</asp:content>