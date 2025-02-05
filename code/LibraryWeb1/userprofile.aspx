<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="LibraryWeb1.userprofile" %>
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
                                    <img width="100px" src="img2/user.png" />
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
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
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
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID ="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>

        </div>
    </div>
    </div>










    <!-- External Styles -->
<style>

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
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff; /* White background */
        transition: transform 0.2s;
    }

    .card:hover {
        transform: scale(1.01); /* Slight hover zoom effect */
    }

    .card-body {
        padding: 20px;
        background-color: #f5f5dc; /* Light Green */

    }

    .badge {
        font-size: 14px;
        background-color:#8B4513;
            color:#ffffff ;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        font-size: 14px;
        margin-bottom: 5px;
        display: inline-block;
        color: #333333; /* Dark text */
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
  background: linear-gradient(90deg, #6c5ce7, #fd79a8); /* Purple to pink gradient */
  border: none;
  color: #ffffff;
  padding: 12px 30px;
  font-size: 16px;
  border-radius: 30px; /* Soft rounded buttons */
  transition: background 0.3s;
}

.btn-primary:hover {
  background: linear-gradient(90deg, #fd79a8, #6c5ce7); /* Reverse gradient on hover */
  transform: scale(1.05); /* Slight scale-up on hover */
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
