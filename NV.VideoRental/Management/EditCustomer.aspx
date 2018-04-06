<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="NV.VideoRental.Management.EditCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
         <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer First Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCustomerInfo" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox5" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox6" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Username</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox7" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Customer Password</h3>
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
                    <asp:Button ID="Button10" Text="Edit Customer!"  runat="server" />
            </div>
</asp:content>
