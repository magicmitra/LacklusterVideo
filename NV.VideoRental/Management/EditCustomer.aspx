<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="NV.VideoRental.Management.EditCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Edit a Customer</h2>
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
                            <asp:HyperLinkField DataNavigateUrlFields="custID" DataNavigateUrlFormatString="EditCustomer.aspx?ID={0}" HeaderText="Customer ID"
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
        <div class="row" style="padding-top: 25px;">
                <div class="col-md-2">
                    <h3>First Name</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cFirstName"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvFirst" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cFirstName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Last Name</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cLastName"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvLast" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cLastName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Address</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cAddress"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvAddress" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cAddress" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>City</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cCity"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvCity" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cCity" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>State</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cState"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvState" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cState" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Zip Code</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cZipCode"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvZip" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cZipCode" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Phone Number</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="cPhoneNumber"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvPhone" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cPhoneNumber" runat="server" />
                </div>
            </div>
        <div class="row" style="padding-top: 15px">
            <div class="col-md-10">

            </div>
            <div class="col-md-2">
                <asp:Button ID="btnComplete" Text="Confirm Edit!" OnClick="btnComplete_Click" ValidateRequestMode="Enabled" runat="server" /> 
                <asp:Button ID="btnDelete" Text="Delete" OnClick="btnDelete_Click" ValidateRequestMode="Disabled" runat="server" /> 
            </div>
        </div>
    </asp:Panel>
</asp:content>
