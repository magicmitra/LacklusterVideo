<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="NV.VideoRental.Management.AddEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Add An Employee</h2>
    <asp:Panel ID="pnlAddEmployee" Visible="true" runat="server">
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee First Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtCustomerInfo" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox1" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox2" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox3" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox4" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox5" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox6" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Username</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="TextBox7" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Password</h3>
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
                    <asp:Button ID="Button10" Text="Add Employee!"  runat="server" />
            </div>
    </asp:Panel>
</asp:content>
