<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookIssuing.aspx.cs" Inherits="LibraryWeb1.adminbookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

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
               dom: '<"row mb-4"<"col-md-6"l><"col-md-6 text-end"f>>' +  // Move Search to rightmost
                   '<"row"<"col-12"tr>>' +
                   '<"row mt-4"<"col-md-6"i><"col-md-6 text-end"p>>',  // Move pagination to bottom right
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





    <style>
        

    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

  

    .card {
        border-radius: 0px;
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
        padding: 20px;
    }

    .btn-lg {
        font-size: 16px;
        padding: 12px;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-warning {
        background-color: #ffc107;
        border-color: #ffc107;
    }

    .btn-lg:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-control {
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
    }

    .home-link {
            color: #40C4FF;
            text-decoration: none;
            font-weight: bold;
            text-align: right;
            margin-top: 5px;
            margin-right: 15px;
        }
    .home-link:hover {
        text-decoration: underline;
    }

    .img-fluid {
        max-width: 100%;
        height: auto;
    }

    .imgview-container {
        text-align: center;
        margin-bottom: 15px;
    }

    .imgview-container img {
        width: 100px;
        border-radius: 5px;
    }

   .table th, .table td {
    white-space: nowrap;
    text-align: center;
}
    .table th {
            background-color: #007bff;
            color: #fff;
        }

.table {
    table-layout: fixed;
    width: 100%;
}


.table td {
    max-width: 200px; /* Adjust width as needed */
    overflow: hidden;
    text-overflow: ellipsis;
}


    .table-striped tbody tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    /* Input styles */
    .form-control {
        padding: 10px;
    }

    .input-group .form-control {
        border-right: 0;
    }

    .input-group .btn {
        border-left: 0;
        background-color: #007bff;
        color: white;
    }

    /* Spacing for buttons */
    .btn-lg {
        margin-top: 10px;
    }

    .row {
        margin-bottom: 10px;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="text-primary font-weight-bold">Book Issuing</h4> 
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px"src="img/learning_4696159.png"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                    <hr /> 
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                    <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox4" runat="server"   placeholder="Member ID"  ></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="TextBox4" ForeColor="Red" runat="server" ErrorMessage="Member ID is required."></asp:RequiredFieldValidator>
    
                                </div>
                            </div>

                             <div class="col-md-6">
                                 <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                     <asp:TextBox cssClass="form-control" ID="TextBox3" runat="server"  placeholder="Book ID"></asp:TextBox>
                                     <asp:Button class="btn btn-primary  " ID="Button1" runat="server" Text="Go " OnClick="Button1_Click" CausesValidation="false"  />
                                </div>
                                                                        <asp:RequiredFieldValidator ControlToValidate="TextBox3" ForeColor="Red" runat="server" ErrorMessage="Book ID is required."></asp:RequiredFieldValidator>

                             </div>
                          </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                    <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox1" runat="server"   placeholder="Member Name" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                    <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox2" runat="server"   placeholder="Book Name" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>

                             
                        </div>

                        
                        <div class="row">
                            <div class="col-md-6">
                                    <label>Start Date</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox5" runat="server"   placeholder="Start Date" TextMode="Date"   ></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ControlToValidate="TextBox5" ForeColor="Red" runat="server" ErrorMessage="Start Date is required."></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                    <label>Due Date</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox6" runat="server"   placeholder="End Date"   TextMode="Date"></asp:TextBox>
                               
                                <asp:RequiredFieldValidator ControlToValidate="TextBox6" ForeColor="Red" runat="server" ErrorMessage="Due Date is required."></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ControlToValidate="TextBox6" ControlToCompare="TextBox5" Operator="GreaterThan" Type="Date" ForeColor="Red" runat="server" ErrorMessage="Due Date must be after Start Date."></asp:CompareValidator>    
                                </div>
                            </div>  
                        </div>




                        <div class="row">
                            <div class="col-6 ">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="Button2_Click"></asp:Button>   
                            </div>
                            <div class="col-6">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server"  CausesValidation="false" Text="Return" OnClick="Button3_Click"></asp:Button>   
                            </div>
                            
                       </div>
                </div>
                <a href="homepage.aspx" class="home-link" CausesValidation="false"> Back to Home</a>
            </div>
                
      <br />           
</div>

        <div class="col-md-7">

             <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="text-primary font-weight-bold">Issued Book List</h4>   
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
                                <div class="table-responsive">
                                <asp:GridView class="table table-striped table-bordered" ID ="GridView1" AutoGenerateColumns="false" runat="server" OnRowDataBound="GridView1_RowDataBound"> 
                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="Member ID" />
                                    <asp:BoundField DataField="member_name" HeaderText="Member Name" />
                                    <asp:BoundField DataField="book_id" HeaderText="Book ID" />

                                    <asp:BoundField DataField="book_name" HeaderText="Book Name" />

                                    <asp:BoundField DataField="issue_date" HeaderText="Issue Date" />

                                    <asp:BoundField DataField="due_date" HeaderText="Due Date" />



                                </Columns>
                                </asp:GridView>
                                        
                                 </div>
                            </div>
                        </div>

                    </div>
                </div>

        </div>
    
    </div>
        </div>








</asp:Content>
