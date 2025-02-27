<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="LibraryWeb1.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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
        <div class="row">
            <div class="col-md-5 ">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="img/si.png" />
                                </center>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label ID="Label1" runat="server" CssClass="badge badge-pill badge-info"  Text="Your Status"></asp:Label>



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
                                    
                                 <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control" ID="TextBox3" runat="server"  placeholder="Full Name"></asp:TextBox>
                                </div>

                            </div>
                        


                        
                            <div class="col-md-6">
                                    <label>Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox4" runat="server"   placeholder="Date Of Birth"  TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col-md-6">
                                    
                                 <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control" ID="TextBox5" runat="server"  placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                </div>

                            </div>
                        

                                 
                        
                            <div class="col-md-6">
                                    <label>Email-ID</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox6" runat="server"   placeholder="Email-ID"  TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                            <div class="row">
                            <div class="col-md-4">
                                    
                                 <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Select" Value="select" />
                                    
    <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
    <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
    <asp:ListItem Text="Assam" Value="Assam" />
    <asp:ListItem Text="Bihar" Value="Bihar" />
    <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
    <asp:ListItem Text="Goa" Value="Goa" />
    <asp:ListItem Text="Gujarat" Value="Gujarat" />
    <asp:ListItem Text="Haryana" Value="Haryana" />
    <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
    <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
    <asp:ListItem Text="Karnataka" Value="Karnataka" />
    <asp:ListItem Text="Kerala" Value="Kerala" />
    <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
    <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
    <asp:ListItem Text="Manipur" Value="Manipur" />
    <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
    <asp:ListItem Text="Mizoram" Value="Mizoram" />
    <asp:ListItem Text="Nagaland" Value="Nagaland" />
    <asp:ListItem Text="Odisha" Value="Odisha" />
    <asp:ListItem Text="Punjab" Value="Punjab" />
    <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
    <asp:ListItem Text="Sikkim" Value="Sikkim" />
    <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
    <asp:ListItem Text="Telangana" Value="Telangana" />
    <asp:ListItem Text="Tripura" Value="Tripura" />
    <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
    <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
    <asp:ListItem Text="West Bengal" Value="West Bengal" />
    <asp:ListItem Text="Andaman and Nicobar Islands" Value="Andaman and Nicobar Islands" />
    <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
    <asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="Dadra and Nagar Haveli and Daman and Diu" />
    <asp:ListItem Text="Delhi" Value="Delhi" />
    <asp:ListItem Text="Lakshadweep" Value="Lakshadweep" />
    <asp:ListItem Text="Puducherry" Value="Puducherry" />
    <asp:ListItem Text="Ladakh" Value="Ladakh" />
    <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        </asp:DropDownList>

                                </div>

                            </div>
                        


                        
                            <div class="col-md-4">
                                    <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ID="TextBox8" runat="server"   placeholder="City"  ></asp:TextBox>
                                </div>
                            </div>

                                 <div class="col-md-4">
                                    <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox9" runat="server"   placeholder="Pincode"  TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                         <div class="row">
                            <div class="col">
                                    
                                 <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control" ID="TextBox7" runat="server"  placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>

                            </div></div>

                         <div class="row">
                             <div class="col text-center">
                                 <span class="badge badge-pill badge-info">Login Credentials</span>
                                

                             </div>

                         </div>
                         <br />
                        <div class="row">
                            <div class="col-md-4">
                                    
                                 <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"  placeholder="User ID" ReadOnly="True" ></asp:TextBox>
                                </div>

                            </div>
                        

                                 
                        
                            <div class="col-md-4">
                                    <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ID="TextBox2" runat="server"   placeholder=" Old Password" ReadOnly="True"></asp:TextBox>

                                </div>
                            </div>
                       

                          <div class="col-md-4">
                                    <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ID="TextBox10" runat="server"   placeholder="Password"  TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary  btn-block btn-lg" ID="Button1" runat="server" Text="Update " OnClick="Button1_Click" />
                                </div>

                                </center>

                            </div>
                        </div>

                    </div>
                     <a href="homepage.aspx" class="home-link"> Back to Home</a>
                </div>

               
                <br />
            </div>


        <div class="col-md-7">

             <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    
                                    <img width="100px" src="img1/webicon.png" />
                                </center>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Issued Books</h4>
                                    
                                    <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Your Books info"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                    <hr /> 
                                <br />
                            </div>
                        </div>

                         <div class="row" >
                            <div class="col">
                                <div class="table-responsive"> 
                                <asp:GridView class="table table-striped table-bordered" ID ="GridView1" runat="server" AutoGenerateColumns="False"    OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
        <asp:BoundField DataField="member_id" HeaderText="Member ID" />
        <asp:BoundField DataField="member_name" HeaderText="Member Name" />
        <asp:BoundField DataField="book_id" HeaderText="Book ID" />
        <asp:BoundField DataField="book_name" HeaderText="Book Name" />
        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" />
        <asp:BoundField DataField="due_date" HeaderText="Due Date" />
        
    </Columns>
                                </asp:GridView>
                                     <br />
                                    </div>
                            </div>
                                
                        </div>

                        
                    </div>
                </div>

        </div>
    </div>
    </div>

    <!-- External Styles -->
<style>


   



     /* Forgot Password & Back to Home Links */
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


    select.form-control {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}
   
   hr{
      border-color:  #d2b48c;
   }
    .card {
    border: none;
    border-radius: 0px;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3); /* Stronger shadow */
    background-color: #FFF5EE; /* White background */
    transition: transform 0.2s, box-shadow 0.3s;
    color: #333333;
     padding: 20px;
}

.card:hover {
    transform: scale(1.03); /* Slight hover zoom effect */
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.35); /* Even stronger shadow on hover */
}



    .card-body {
        padding: 20px;
        background-color:  #FFF5EE; /* Light Green */

    }

   .badge {
    display: inline-block;
    padding: 5px 10px;
    font-size: 13px;
    font-weight: bold;
    border-radius: 12px;
    color: #FFFFFF;  /* White text */
    background-color: #FF8C00; /* Dark Orange */
}


    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        font-size: 14px;
        margin-bottom: 5px;
        display: inline-block;
        color: #2C3E50; /* Dark text */
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ced4da;
        padding: 10px;
        font-size: 14px;
        transition: box-shadow 0.3s;
    }

    .form-control:focus {
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Highlight on focus */
        border-color: #007bff;
    }

    .btn-primary {
        background-color: #007BFF; /* Solid Navy Blue */
        border: none;
        color: #ffffff;
        padding: 12px 30px;
        font-size: 16px;
        border-radius: 4px; /* Box shape */
        font-weight: bold;
        transition: background 0.3s, transform 0.2s, box-shadow 0.3s;
        box-shadow: 0 5px 15px rgba(0, 0, 139, 0.6); /* Increased button shadow */
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Slightly darker blue for hover effect */
        transform: scale(1.06);
        box-shadow: 0 8px 20px rgba(0, 0, 139, 0.8); /* Even stronger shadow on hover */
    }



    a {
        color: #008080;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    h4 {
        font-size: 20px;
        font-weight: bold;
        color: #333333;
    }
    span{
        color: #333333;

    }

    img {
        margin-bottom: 15px;
    }

    .table {
        margin-top: 20px;
        font-size: 14px;
    }


</style>


</asp:Content>
