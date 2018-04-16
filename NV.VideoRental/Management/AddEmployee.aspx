<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="NV.VideoRental.Management.AddEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Add An Employee</h2>
    <asp:Panel ID="pnlAddEmployee" Visible="true" runat="server">
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-2">
                    <h3>First Name</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eFirstName"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvFirst" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eFirstName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Last Name</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eLastName"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvLast" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eLastName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Address</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eAddress"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvAddress" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eAddress" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>City</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eCity"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvCity" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eCity" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>State</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eState"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvState" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eState" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Zip Code</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eZipCode"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvZip" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eZipCode" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Phone Number</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="ePhoneNumber"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvPhone" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="ePhoneNumber" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Username</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="eUsername"
                            Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                            ID="rfvUsername" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eUsername" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2">
                    <h3>Password</h3>
                </div>
                <div class="col-md-4">
                    <ASP:RequiredFieldValidator ControlToValidate="ePassword"
                        Display="Static" ErrorMessage="*Required" ForeColor="Red" runat="server" 
                        ID="rfvPassword" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="ePassword" TextMode="Password" runat="server" />                  
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-4">
                    <h3>Is Manager?</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:CheckBox ID="eIsManager" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="eAddEmployee" Text="Add Employee!" OnClick="eAddEmployee_Click" runat="server" />
                </div>
            </div>
    </asp:Panel>
</asp:content>
