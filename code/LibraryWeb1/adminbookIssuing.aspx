<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookIssuing.aspx.cs" Inherits="LibraryWeb1.adminbookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">



        //search andalll buttons
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

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4> 
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
                            <div class="col-md-6">
                                    <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox4" runat="server"   placeholder="Member ID"  ></asp:TextBox>
                                </div>
                            </div>

                             <div class="col-md-6">
                                 <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                     <asp:TextBox cssClass="form-control" ID="TextBox3" runat="server"  placeholder="Book ID"></asp:TextBox>
                                     <asp:Button class="btn btn-primary  " ID="Button1" runat="server" Text="Go " OnClick="Button1_Click" />
                                </div>
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
                                </div>
                            </div>

                            <div class="col-md-6">
                                    <label>Due Date</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox6" runat="server"   placeholder="End Date"   TextMode="Date"></asp:TextBox>
                                </div>
                            </div>  
                        </div>




                        <div class="row">
                            <div class="col-6 ">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="Button2_Click"></asp:Button>   
                            </div>
                            <div class="col-6">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="Button3_Click"></asp:Button>   
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
                                    <h4>Issued Book List</h4>   
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








</asp:Content>
