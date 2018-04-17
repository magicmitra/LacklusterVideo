<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NV.VideoRental.Account.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
    <section id="loginForm">
        <table>
           <tr>
              <td>Email:</td>
              <td><asp:TextBox ID="txtUser" runat="server" /></td>
              <td><ASP:RequiredFieldValidator ControlToValidate="txtUser"
                   Display="Static" ErrorMessage="*" runat="server" 
                   ID="vUserName" /></td>
           </tr>
           <tr>
              <td>Password:</td>
              <td><asp:TextBox id="txtPass" TextMode="Password" runat="server" /></td>
              <td><ASP:RequiredFieldValidator ControlToValidate="txtPass"
                  Display="Static" ErrorMessage="*" runat="server" 
                  ID="vUserPass" />
              </td>
           </tr>
           <tr>
              <td>Persistent Cookie:</td>
              <td><ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" /></td>
              <td></td>
           </tr>
        </table>
        <asp:Button ID="cmdLogin" Text="Login" OnClick="cmdLogin_ServerClick" runat="server" />
        <asp:HiddenField ID="txtIsManager" runat="server" />
        <asp:Label id="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
    </section>
</asp:Content>
