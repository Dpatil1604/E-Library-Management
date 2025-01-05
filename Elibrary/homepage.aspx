<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Elibrary.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/home-bg.jpg" class="img-fluid"/>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Our 3 Primary Features -</b></p>
                    </center>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <img width ="150px" src="imgs/digital-inventory.png" />
                    <h4>Digital Book Inventory</h4>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
