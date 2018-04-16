<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="NV.VideoRental.Management.AddCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Add New Customer</h2>
    <asp:Panel ID="pnlAddCustomer" Visible="true" runat="server">
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
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="cAddCustomer" OnClick="cAddCustomer_Click" Text="Add Customer!"  runat="server" />
                </div>
            </div>
    </asp:Panel>
</asp:content>
