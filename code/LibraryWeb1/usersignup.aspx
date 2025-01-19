<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="LibraryWeb1.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <!--<div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
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
                                    <h4>User Registration</h4>
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
                            <div class="col-md-6">
                                    
                                 <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"  placeholder="User ID" ></asp:TextBox>
                                </div>

                            </div>
                        

                                 
                        
                            <div class="col-md-6">
                                    <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ID="TextBox2" runat="server"   placeholder="Password"  TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                
                                <div class="form-group">
                                    <asp:Button class="btn btn-success  btn-block  btn-lg" ID="Button1" runat="server" Text="Login" />
                                </div>

                                

                            </div>
                        </div>

                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div><img src="img2/bg1.jpg" />
        </div>
    </div>-->

<div style="display: flex; justify-content: center; align-items: center; min-height: 90vh; background-image: url('img2/S1.jpg'); background-size: cover; background-position: center; font-family: Arial, sans-serif;">
    <div class="container" style="width: 55%; max-width: 700px; background-color: #DFF6FF; border-radius: 4px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3); padding: 30px; margin: 20px; color: #333333;">
        
        <!-- User Icon -->
        <div class="text-center mb-3">
            <img width="100px" src="img2/user.png" alt="User Icon" />
        </div>

        <!-- Title -->
        <div class="text-center">
            <h3 style="color: #1B3A57;">User Registration</h3>
            <hr style="border-color: #1B3A57;" />
        </div>

        <!-- Form Fields -->
        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">Full Name</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="FullNameTextBox" runat="server" placeholder="Full Name" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">Date Of Birth</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="DateOfBirthTextBox" runat="server" placeholder="Date Of Birth" TextMode="Date" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">Contact No</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="ContactTextBox" runat="server" placeholder="Contact No" TextMode="Number" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">Email-ID</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="EmailTextBox" runat="server" placeholder="Email-ID" TextMode="Email" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Address Details -->
        <div class="row">
            <div class="col-md-4 mb-3">
                <label style="color: #1B3A57;">State</label>
                <div class="form-group">
                    <asp:DropDownList class="form-control" ID="StateDropDownList" runat="server" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;">
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
            <div class="col-md-4 mb-3">
                <label style="color: #1B3A57;">City</label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="CityTextBox" runat="server" placeholder="City" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label style="color: #1B3A57;">Pincode</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="PincodeTextBox" runat="server" placeholder="Pincode" TextMode="Number" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label style="color: #1B3A57;">Full Address</label>
            <div class="form-group">
                <asp:TextBox cssClass="form-control" ID="AddressTextBox" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
            </div>
        </div>

        <!-- Login Credentials Section -->
        <div class="text-center mb-3">
            <span class="badge badge-pill badge-info p-2" style="font-size: 1rem; background-color: #8B4513; color: #ffffff;">Login Credentials</span>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">User ID</label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="UserIDTextBox" runat="server" placeholder="User ID" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color: #1B3A57;">Password</label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="PasswordTextBox" runat="server" placeholder="Password" TextMode="Password" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <asp:Button cssClass="btn btn-primary btn-block btn-lg" ID="RegisterButton" runat="server" Text="Register" 
                        style="background-color: #007BFF; color: #FFFFFF; padding: 12px 20px; border-radius: 5px; font-size: 1.1rem; font-weight: bold; width: 100%;" OnClick="RegisterButton_Click"  />
        </div>

        <!-- Back Link -->
        <div class="text-center mt-4">
            <a href="homepage.aspx" class="text-muted" style="color: #505050; text-decoration: none; font-weight: bold;">&laquo; Back to Home</a>
        </div>
    </div>
</div>

<style>
    /* Hover effect for buttons */
    .btn:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>




    





  









</asp:Content>
