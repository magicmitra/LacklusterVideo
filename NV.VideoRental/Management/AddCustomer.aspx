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
                    <asp:TextBox ID="cFirstName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cLastName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cAddress" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cCity" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cState" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cZipCode" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Customer Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="cPhoneNumber" runat="server" />
                </div>
            </div>
            <div class="row">
                    <asp:Button ID="cAddCustomer" OnClick="cAddCustomer_Click" Text="Add Customer!"  runat="server" />
            </div>
    </asp:Panel>
</asp:content>
