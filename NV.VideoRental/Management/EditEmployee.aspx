<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="NV.VideoRental.Management.EditEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
         <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee First Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCustomerInfo" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox5" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox6" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Username</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox7" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Change Employee Password</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox8" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Employee Manager?</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </div>
            </div>
            <div class="row">
                    <asp:Button ID="Button10" Text="Edit Employee!"  runat="server" />
            </div>
</asp:content>
