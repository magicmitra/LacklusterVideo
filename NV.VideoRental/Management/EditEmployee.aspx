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
                        HeaderStyle-ForeColor="White" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="empID">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="empID" DataNavigateUrlFormatString="EditEmployee.aspx?ID={0}" HeaderText="Employee ID"
                                DataTextField="empID" />
                            <asp:BoundField DataField="firstName" HeaderText="First Name" 
                                SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" 
                                SortExpression="lastName" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
    </asp:Panel>
    <asp:Panel ID="pnlEdit" Visible="true" runat="server">
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
                    <h3>New Password</h3>
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
