<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="NV.VideoRental.Admin.EditUser" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit User</h2>
    <div class="row">
        <div class="col-md-1">
            Username: 
        </div>
        <div class="col-md-5">
            <asp:Label ID ="lblUserName" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            Name: 
            <asp:Label ID ="lblName" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            Street Address: 
            <asp:TextBox ID ="txtAddress" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            City: 
            <asp:TextBox ID ="txtCity" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            State: 
            <asp:TextBox ID ="txtState" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            Zip: 
            <asp:TextBox ID ="txtZip" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            Phone: 
            <asp:TextBox ID ="txtPhone" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            Is Manager: 
            <asp:CheckBox ID="chkManager" Checked="false" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Button ID="btnSave" Text="Save" OnClick="btnSave_Click" runat="server" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnDelete" Text="Deactivate" OnClick="btnDelete_Click" runat="server" />
        </div>
        <div class="col-md-1">
            <asp:Button ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" runat="server" />
        </div>
    </div>
</asp:Content>
