<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="LibraryWeb1.adminmembermanagement" %>
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


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4> 
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
                              <div class="col-md-3">
                                 <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                     <asp:TextBox cssClass="form-control " ID="TextBox3" runat="server"  placeholder="Member ID"></asp:TextBox>
                                     <asp:LinkButton ID="LinkButton4"  class="btn btn-primary " runat="server" OnClick="LinkButton4_Click">Go</asp:LinkButton>
                                </div>
                             </div>
                          </div>
                            <div class="col-md-4">
                                    <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox4" runat="server"   placeholder="Full Name" ReadOnly="True" ></asp:TextBox>
                                </div>
                            </div>
                                <div class="col-md-5">
                                    <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                     <asp:TextBox cssClass="form-control mr-1" ID="TextBox7" runat="server"  placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                     <asp:LinkButton ID="LinkButton1"  class="btn btn-success mr-1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton2"  class="btn btn-warning mr-1" runat="server" OnClick="LinkButton2_Click"  ><i class="far fa-pause-circle text-white"></i></asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton3"  class="btn btn-danger mr-1" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                    </div> 
                             </div>
                                
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                    <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox8" runat="server"   placeholder="DOB" ReadOnly="True" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                    <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox1" runat="server"   placeholder="Contact Number" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                    <label>Email-ID</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox2" runat="server"   placeholder="Email-ID" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>

                             
                        </div>

                        
                        <div class="row">

                            
                            <div class="col-md-4">
                                    <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox9" runat="server"   placeholder="State" ReadOnly="True" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                    <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox10" runat="server"   placeholder="City" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                    <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox11" runat="server"   placeholder="Pin Code" ReadOnly="True"  ></asp:TextBox>
                                </div>
                            </div>
                            

                        </div>

                        <div class="row">
                            <div class="col-12 ">
                                <label>Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox5" runat="server"   placeholder="Full Postal Address" ReadOnly="True" TextMode="MultiLine"  Rows="2"></asp:TextBox>
                                </div>

                                </div>
                            </div>

                          

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button2_Click"></asp:Button>   
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
                                    <h4>Member List</h4>   
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
                                
                                <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" />
                                        <asp:BoundField DataField="state" HeaderText="State" />
                                           <asp:BoundField DataField="city" HeaderText="City" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" />
        
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
