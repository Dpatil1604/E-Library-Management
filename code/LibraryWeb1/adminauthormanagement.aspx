<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="LibraryWeb1.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- DataTables & jQuery -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

 
   


    <style>

/* General Body Styling */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

/* Card Design */
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

.card-body {
    padding: 30px;
}

/* Card Header */
h4 {
    font-size: 24px;
    color: #343a40;
    font-weight: 600;
    margin-bottom: 20px;
}

.text-primary {
    color: #007bff !important;
}

/* Button Styling */
.btn {
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.btn-lg {
    font-size: 16px;
    padding: 12px;
}

.btn-block {
    width: 100%;
}

.btn-primary:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.btn-success:hover {
    background-color: #28a745;
    transform: scale(1.05);
}

.btn-warning:hover {
    background-color: #ffc107;
    transform: scale(1.05);
}

.btn-danger:hover {
    background-color: #dc3545;
    transform: scale(1.05);
}

/* Input Fields */
.form-control {
    border-radius: 5px;
    border: 1px solid #ccc;
    padding: 12px;
    font-size: 16px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.input-group {
    display: flex;
    justify-content: space-between;
}

.input-group .form-control {
    flex: 1;
}

/* Header Alignment */
.text-center {
    text-align: center;
}

/* Profile Image */
.img-fluid {
    max-width: 100%;
    height: auto;
}

.rounded-circle {
    border-radius: 50%;
}

/* Section Spacing */
.mt-5 {
    margin-top: 50px;
}

/* Hover Effects on Cards */
.card-body:hover {
    background-color: #f8f9fa;
}

/* Table Styling */
.table {
    width: 100%;
    margin-top: 20px;
}

.table-bordered {
    border: 1px solid #ddd;
}

.table-striped tbody tr:nth-child(odd) {
    background-color: #f2f2f2;
}

.table-hover tbody tr:hover {
    background-color: #e9ecef;
}

.table th, .table td {
    padding: 15px;
    text-align: left;
    font-size: 14px;
}

.table th {
    background-color: #007bff;
    color: #fff;
}

.table-bordered th, .table-bordered td {
    border: 1px solid #ddd;
}

/* Form and Layout Spacing */
.form-group {
    margin-bottom: 15px;
}

.input-group {
    margin-bottom: 15px;
}

hr {
    border: 1px solid #ddd;
}

/* Link Styling */
.text-muted {
    color: #6c757d !important;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

/* Footer Section */
footer {
    text-align: center;
    padding: 20px;
    background-color: #f1f1f1;
    font-size: 14px;
    color: #343a40;
}

/* Responsive Design */
@media (max-width: 767px) {
    .card-body {
        padding: 20px;
    }

    .btn-lg {
        font-size: 14px;
        padding: 10px;
    }

    .table {
        font-size: 12px;
    }
}
 a.home-link {
    color: #40C4FF;
    text-decoration: none;
    font-weight: bold;
    display: block;
    text-align: right; /* Align text to the right */
    margin-top: 5px;
    margin-right: 15px; /* Add space from the right */
    transition: color 0.3s ease-in-out;
}


 /* Hover Effect */
 a.home-link:hover {
    color: #FFC107; /* Soft Yellow */
    text-decoration: underline;
}



 /* Align search box inline with label */
.dataTables_filter_custom {
    display: flex !important;
    align-items: center;
    gap: 8px;  /* Adjust space between label and input */
}

/* Reduce search box width */
.dataTables_filter input {
    width: 200px; /* Adjust as needed */
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}





    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#<%= GridView1.ClientID %>');

        // Ensure GridView has a proper <thead> and <tbody> structure
        table.find('thead').remove();
        table.prepend($('<thead></thead>').append(table.find('tr:first')));

        // Initialize DataTables with custom layout
        table.DataTable({
            paging: true,
            searching: true,
            info: true,
            lengthChange: true,
            autoWidth: false,
            responsive: true,
            dom: '<"row mb-4"<"col-md-6"l><"col-md-6 d-flex align-items-center dataTables_filter_custom"f>>' +
                '<"row"<"col-12"tr>>' +
                '<"row mt-4"<"col-md-6"i><"col-md-6 text-end"p>>',
            language: {
                lengthMenu: "Show _MENU_ entries",
                search: "Search:",
                info: "Showing _START_ to _END_ of _TOTAL_ entries",
                paginate: {
                    previous: "Previous",
                    next: "Next"
                }
            }
        });
    });
    </script>


    <div class="container mt-5">
    <div class="row">
        <!-- Author Details Section -->
        <div class="col-md-5">
            <div class="card shadow-lg border-0 rounded">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4 class="text-primary font-weight-bold">Author Details</h4> 
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <center>
                                <img width="100px" src="img2/user.png" class="img-fluid rounded-circle" />
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <hr /> 
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label for="TextBox3">Author ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server" placeholder="Enter ID"></asp:TextBox>
                                    <asp:Button class="btn btn-primary ml-2" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <label for="TextBox4">Author Name</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="TextBox4" runat="server" placeholder="Enter Author Name"></asp:TextBox>
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
                 
            <a href="homepage.aspx" class="home-link" > Back to Home</a><br /><br />
            </div>
            
        </div>

        <!-- Author List Section -->
        <div class="col-md-7">
            <div class="card shadow-lg border-0 rounded">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4 class="text-primary font-weight-bold">Author List</h4>   
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <hr /> 
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" Width="100%" AutoGenerateColumns="true"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

       


</asp:Content>
