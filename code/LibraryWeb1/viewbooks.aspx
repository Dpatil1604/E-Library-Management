<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="LibraryWeb1.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-sm-12">
            <center>
                <h3>Book Inventory List</h3>
            </center>

            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                        <div class="alert alert-success" role="alert">
                            <asp:Label runat="server" Text="Label"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-12 text-center">
            <a href="home.aspx">&laquo; Back to Home</a>
        </div>
    </div>
</div>


</asp:Content>
