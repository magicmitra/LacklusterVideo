<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="NV.VideoRental.Admin.Movies" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <h2>Upload New Movies</h2>
    <h3>Use CSV Format - Provided by Professor</h3>
   <div class="row" style="padding-top: 20px;">
        <div class="col-md-12">
                <asp:Label ID="lblMessage" Font-Bold="true" Font-Size="Medium" ForeColor="DarkGreen" runat="server" />
        </div>
   </div>
   <div class="row" style="padding-top: 20px;">
        <div class="col-md-4">
                <h3>Movie CSV File:</h3>
        </div>
   </div>
    <div class="row">
        <div class="col-md-4">
            <asp:FileUpload ID="fuMovies" runat="server" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnUpload" Text="Upload File" OnClick="btnUpload_Click" runat="server" />
        </div>
    </div>
</asp:content>