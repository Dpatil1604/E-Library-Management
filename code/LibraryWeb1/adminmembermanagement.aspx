<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="LibraryWeb1.adminmembermanagement" %>
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
                                    <h4 class="text-primary font-weight-bold">Member Details</h4> 
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="img/id-card_3277444.png"  />
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
                                        
                                     <asp:LinkButton ID="LinkButton4"  class="btn btn-primary " runat="server" OnClick="LinkButton4_Click" CausesValidation="false" >Go</asp:LinkButton>
                                </div>
                                    <asp:RequiredFieldValidator ID="rfvMemberID" runat="server" ControlToValidate="TextBox3"
                                ErrorMessage="Member ID is required" ForeColor="Red" Display="Dynamic" />
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
               <a href="homepage.aspx" class="home-link" CausesValidation="false"> Back to Home</a>
            </div>
                
</div>

        <div class="col-md-7">

             <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="text-primary font-weight-bold">Member List</h4>   
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
        </div>






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
        .btn-lg {
    font-size: 16px;
    padding: 12px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.btn-lg:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
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


 /* Hover Effect */
  .home-link:hover {
        text-decoration: underline;
    }

    </style>



</asp:Content>
