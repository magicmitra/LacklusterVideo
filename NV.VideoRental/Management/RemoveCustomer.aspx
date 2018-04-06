<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveCustomer.aspx.cs" Inherits="NV.VideoRental.Management.RemoveCustomer" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row" style="padding-top: 25px;">
        <div class="col-md-4">
            <h3>Enter Customer ID Or Customer Full Name</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:TextBox ID="TextBox9" runat="server" />
        </div>
    </div>
    <div class="row">
        <asp:Button ID="Button10" Text="Remove!" runat="server" />
    </div>
</asp:content>
