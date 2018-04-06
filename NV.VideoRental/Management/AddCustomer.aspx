<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="NV.VideoRental.Management.AddCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Add An Customer</h2>
    <asp:Panel ID="pnlAddCustomer" Visible="true" runat="server">
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer First Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCustomerInfo" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox5" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox6" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Username</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox7" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Password</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox8" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Customer Manager?</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>
            </div>
            <div class="row">
                    <asp:Button ID="Button10" Text="Add Customer!"  runat="server" />
            </div>
    </asp:Panel>
</asp:content>
