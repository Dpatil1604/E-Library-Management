<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="LibraryWeb1.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
        <script type="text/javascript">
            $(document).ready(function () {
                // Fix for GridView headers
                var table = $('#<%= GridView1.ClientID %>');

        // Ensure GridView has a proper <thead> and <tbody> structure
        table.find('thead').remove(); // Remove any existing <thead>
        table.prepend($('<thead></thead>').append(table.find('tr:first'))); // Wrap the first row as <thead>

        // Initialize DataTables with Bootstrap 5 styling
        table.DataTable({
            paging: true,          // Enable pagination
            searching: true,       // Enable search
            info: true,            // Enable entry info
            lengthChange: true,    // Enable "Show entries"
            autoWidth: false,      // Disable auto width for better alignment
            responsive: true,      // Make table responsive
            dom: '<"row"<"col-md-6"l><"col-md-6"f>>' + // Layout for length and search
                '<"row"<"col-12"tr>>' +               // Layout for table
                '<"row"<"col-md-5"i><"col-md-7 text-end"p>>',  // Align pagination to the right
            language: {
                lengthMenu: "Show _MENU_ entries",
                search: "Search:",
                info: "Showing _START_ to _END_ of _TOTAL_ entries",
                paginate: {
                    previous: "Previous", // Replace with "Previous"
                    next: "Next"          // Replace with "Next"
                }
            }
        });
    });
       </script>





  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4> 
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="img2/user.png" />
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
                                 <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                     <asp:TextBox cssClass="form-control" ID="TextBox3" runat="server"  placeholder="ID"></asp:TextBox>
                                     <asp:Button class="btn btn-primary  " ID="Button1" runat="server" Text="Go " OnClick="Button1_Click" />
                                </div>
                             </div>
                          </div>
       
                            <div class="col-md-8">
                                    <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox4" runat="server"   placeholder="Author Name"  ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4 ">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click"></asp:Button>   
                            </div>
                            <div class="col-4 ">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click"></asp:Button>   
                            </div>
                            <div class="col-4 ">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click"></asp:Button>   
                            </div>
                       </div>
                </div>
               
            </div>
                <br />
                 <a href="homepage.aspx"><< Back to Home</a><br /><br />
    </div>

        <div class="col-md-7">

             <div class="card">
                    <div class="card-body">
                         
                       

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>   
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

                               
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" Width="561px" AutoGenerateColumns="true"></asp:GridView>
                                
                            </div>
                        </div>

                    </div>
                </div>

        </div>
    
    </div></div>
       


</asp:Content>
