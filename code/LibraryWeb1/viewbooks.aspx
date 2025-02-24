<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="LibraryWeb1.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
/* General Body and Container Styling */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    margin: 40px auto;
    max-width: 1200px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

/* Typography */
h3 {
    font-size: 35px;
    font-weight: 700;
    text-align: center;
    color: #343a40;
    margin-bottom: 20px;
    text-transform: uppercase; /* Makes text uppercase */
    letter-spacing: 1px; /* Adds slight spacing between letters */
    line-height: 1.4; /* Improves readability */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* Adds a soft shadow effect */
    transition: all 0.3s ease-in-out; /* Smooth transition effect */
}

/* Underline effect on hover */
h3:hover {
    text-decoration: underline;
    text-decoration-thickness: 3px; /* Makes the underline bolder */
    //text-decoration-color: #ffcc00; /* Adds a bright yellow underline */
    transform: scale(1.05); /* Slightly enlarges the text */
}


a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    color: #0056b3;
    text-decoration: underline;
}

/* Alerts */
.alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.alert-success {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}

/* Table Styling */
.table {
    border-collapse: collapse;
    width: 100%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table thead th {
    background: linear-gradient(135deg, #002147, #004aad);
    color: white;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    border: none;
}

.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.table tbody tr:hover {
    background-color: #f1f1f1;
}

/* Search Box Styling */
.dataTables_filter input {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #ccc;
    padding: 5px 10px;
    border-radius: 0;
    transition: all 0.3s ease;
}

/* Data Table Wrapper */
.dataTables_wrapper {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
    padding: 15px;
    background-color: #fff;
    transition: all 0.3s ease;
}

.dataTables_wrapper:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

/* General Button Styling */
.btn {
    display: inline-block;
    font-weight: 400;
    color: #fff;
    text-align: center;
    background-color: #007bff;
    border: 1px solid #007bff;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn:hover {
    color: #fff;
    background-color: #0056b3;
    border-color: #004085;
}

/* Back to Home Button */
.back-button {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 15px;
    background-color: #004aad;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
}

.back-button:hover {
    background-color: #002147;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
}

/* Card Styling */
.card {
    background: #f8f9fa;
    border: 1px solid #dee2e6;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4), 
                0 3px 6px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease-in-out;
}


.card-body {
    padding: 20px;
}

/* Grid System */
.row {
    margin: 0 -10px;
}

.row > [class*="col"] {
    padding: 0 10px;
}

/* Book Image Hover Effect */
.img-fluid {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Scale up and add shadow on hover */
.img-fluid:hover {
    transform: scale(1.1);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    border-radius: 5px;
}







</style>


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
            dom: '<"top-section d-flex justify-content-between mb-3"<"entries-length"l><"search-box"f>>' +
                '<"table-container"tr>' +
                '<"bottom-section d-flex justify-content-between mt-3"<"info-section"i><"pagination-box"p>>',
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

        // Move search box to the top right (Green Line Position)
        $(".search-box").css({
            "position": "absolute",
            "top": "10px", // Adjust based on your layout
            "right": "20px" // Adjust based on your layout
        });
    });



   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3>Book Inventory </h3>
        <br />
        <div class="card">
            <div class="card-body">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <div class="alert alert-success" role="alert">
                        <asp:Label runat="server" Text="Label"></asp:Label>
                    </div>
                </asp:Panel>

                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="book_id" HeaderText="ID">
                            <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Author - <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Genre - <asp:Label ID="Label3" runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Language - <asp:Label ID="Label4" runat="server" Text='<%# Eval("language") %>' Font-Bold="True"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Publisher - <asp:Label ID="Label5" runat="server" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                    &nbsp;| Publish Date - <asp:Label ID="Label6" runat="server" Text='<%# Eval("publish_date") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Pages - <asp:Label ID="Label7" runat="server" Text='<%# Eval("no_of_pages") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Edition - <asp:Label ID="Label8" runat="server" Text='<%# Eval("edition") %>' Font-Bold="True"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Cost - <asp:Label ID="Label9" runat="server" Text='<%# Eval("book_cost") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Actual Stock - <asp:Label ID="Label10" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>
                                                    &nbsp;| Available - <asp:Label ID="Label11" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Description - <asp:Label ID="Label12" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

      <div class="text-center">
            <a href="homepage.aspx" class="back-button"> Back to Home</a>
        </div>


    </div>
</asp:Content>
