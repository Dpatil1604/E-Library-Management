<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="LibraryWeb1.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
     <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            margin-bottom: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        .btn-lg {
            font-size: 16px;
            padding: 12px;
        }
        .table th {
            background-color: #007bff;
            color: #fff;
        }
        .home-link {
            color: #40C4FF;
            text-decoration: none;
            font-weight: bold;
            text-align: right;
            margin-top: 5px;
            margin-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#<%= GridView1.ClientID %>');
            table.find('thead').remove();
            table.prepend($('<thead></thead>').append(table.find('tr:first')));
            table.DataTable({
                paging: true,
                searching: true,
                info: true,
                lengthChange: true,
                autoWidth: false,
                responsive: true,
                dom: '<"row mb-4"<"col-md-6"l><"col-md-6 text-end"f>>' +
                    '<"row"<"col-12"tr>>' +
                    '<"row mt-4"<"col-md-6"i><"col-md-6 text-end"p>>',
                language: {
                    lengthMenu: "Show _MENU_ entries",
                    search: "Search:",
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    paginate: { previous: "Previous", next: "Next" }
                }
            });
        });
    </script>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-5">
                <div class="card shadow-lg border-0 rounded">
                    <div class="card-body">
                        <center><h4 class="text-primary font-weight-bold">Publisher Details</h4></center>
                        <center><img width="100px" src="img2/user.png" class="img-fluid rounded-circle" /></center>
                        <hr />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Enter ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary ml-2" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Enter Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-success btn-block" runat="server" Text="Add" OnClick="Button2_Click"></asp:Button>   
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-warning btn-block" runat="server" Text="Update" OnClick="Button3_Click"></asp:Button>   
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-danger btn-block" runat="server" Text="Delete" OnClick="Button4_Click"></asp:Button>   
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx" class="home-link"> Back to Home</a><br /><br />
                </div>
            </div>
            <div class="col-md-7">
                <div class="card shadow-lg border-0 rounded">
                    <div class="card-body">
                        <center><h4 class="text-primary font-weight-bold">Publisher List</h4></center>
                        <hr />
                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" Width="100%" AutoGenerateColumns="true"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
