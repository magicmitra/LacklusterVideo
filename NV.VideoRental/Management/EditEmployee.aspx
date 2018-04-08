<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="NV.VideoRental.Management.EditEmployee" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Edit a Employee</h2>
    <asp:Panel ID="pnlSelectEmployee" Visible="true" runat="server">
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Scan Employee ID/Enter Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtEmployeeInfo" runat="server" />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="Button1" Text="Find!" OnClick="btnGetEmployee_Click" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top:20px">
                <div class="col-md-12">
                    <asp:GridView ID="gvEmployees" runat="server" AllowSorting="True" CssClass="mGrid" 
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="custID">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="custID" DataNavigateUrlFormatString="EditEmployee.aspx?ID={0}" HeaderText="Employee ID"
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
                <b>Employee ID: </b>
                <asp:Label ID="lblEmployeeID" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 10px;">
            <div class="col-md-4">
                <b>Employee Name: </b>
                <asp:Label ID="lblEmployeeName" runat="server" />
            </div>
        </div>
        <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee First Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eFirstName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Last Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eLastName" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Address</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eAddress" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee City</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eCity" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee State</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eState" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Zip Code</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eZipCode" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee Phone Number</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="ePhoneNumber" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter Employee User Name</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="eUsername" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Enter New Employee Password</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="ePassword" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 25px;">
                <div class="col-md-4">
                    <h3>Is Employee Manager?</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:CheckBox ID="eIsManager" runat="server" />
                </div>
            </div>
            <div class="row" style="padding-top: 15px">
            <div class="col-md-10">

            </div>
            <div class="col-md-2">
                <asp:Button ID="btnComplete" Text="Confirm Edit!" OnClick="btnComplete_Click" ValidateRequestMode="Enabled" runat="server" /> 
            </div>
        </div>
    </asp:Panel>
</asp:content>
