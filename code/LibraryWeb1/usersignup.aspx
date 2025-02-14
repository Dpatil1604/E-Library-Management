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

<div class="bg-container">
    <br />
    <div class="container ">
        <!-- User Icon -->
        <div class="text-center mb-3">
            <img width="100px" src="img2/user.png" alt="User Icon" />
        </div>

        <!-- Title -->
        <div class="text-center">
            <h3 style="color: #FFFFFF;">User Registration</h3>
            <hr style="border-color: #FFFFFF;" />
        </div>
         <!-- Validation Summary -->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ShowSummary="true" />


        <!-- Form Fields -->
        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color:#FFFFFF;">Full Name</label>
                <div class="form-group">
                   
                    
                    
                 <asp:TextBox cssClass="form-control" ID="FullNameTextBox" runat="server" placeholder="Full Name" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FullNameValidator" runat="server" ControlToValidate="FullNameTextBox"
    ErrorMessage="Full Name is required." ForeColor="#FF5733"  Font-Bold="true"  Display="Dynamic" />
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color:#FFFFFF;">Date Of Birth</label>
                <div class="form-group">
                    
                    <asp:TextBox cssClass="form-control" ID="DateOfBirthTextBox" runat="server" placeholder="Date Of Birth" TextMode="Date" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DOBValidator" runat="server" ControlToValidate="DateOfBirthTextBox"
    ErrorMessage="Date of Birth is required." ForeColor="#FF5733"  Font-Bold="true"  Display="Dynamic" />

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color:#FFFFFF;">Contact No</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="ContactTextBox" runat="server" placeholder="Contact No" TextMode="Number" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
               <asp:RequiredFieldValidator ID="ContactValidator" runat="server" ControlToValidate="ContactTextBox"
    ErrorMessage="Contact No is required." ForeColor="#FF5733"  Font-Bold="true" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="ContactNumberValidator" runat="server" ControlToValidate="ContactTextBox"
    ErrorMessage="Enter a valid 10-digit number." ForeColor="#FF5733"  Font-Bold="true"  Display="Dynamic"
    ValidationExpression="^\d{10}$" />
                    </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color: #FFFFFF;">Email-ID</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="EmailTextBox" runat="server" placeholder="Email-ID" TextMode="Email" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
               <!-- Required Field Validator -->
        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox"
            ErrorMessage="Email-ID is required." ForeColor="#FF5733"  Font-Bold="true" Display="Dynamic" />

        <!-- Regular Expression Validator -->
        <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="EmailTextBox"
            ErrorMessage="Enter a valid email address." ForeColor="#FF5733"  Font-Bold="true"  Display="Dynamic"
            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
                    </div>
            </div>
        </div>

        <!-- Address Details -->
        <div class="row">
            <div class="col-md-4 mb-3">
                <label style="color: #FFFFFF;">State</label>
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
                    <asp:RequiredFieldValidator ID="StateValidator" runat="server" ControlToValidate="StateDropDownList"
    InitialValue="select" ErrorMessage="Please select a State." ForeColor="#FF5733"  Font-Bold="true" Display="Dynamic" />
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label style="color: #FFFFFF;">City</label>
                <div class="form-group">
                    
                    <asp:TextBox class="form-control" ID="CityTextBox" runat="server" placeholder="City" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CityValidator" runat="server" ControlToValidate="CityTextBox"
    ErrorMessage="City is required." ForeColor="#FF5733"  Font-Bold="true"  Display="Dynamic" />
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label style="color: #FFFFFF;">Pincode</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="PincodeTextBox" runat="server" placeholder="Pincode" TextMode="Number" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PincodeValidator" runat="server" ControlToValidate="PincodeTextBox"
    ErrorMessage="Pincode is required." ForeColor="#FF5733"  Font-Bold="true"   Display="Dynamic" />
<asp:RegularExpressionValidator ID="PincodeFormatValidator" runat="server" ControlToValidate="PincodeTextBox" ForeColor="#FF5733"  Font-Bold="true" 
    ErrorMessage="Enter a valid 6-digit pincode." Display="Dynamic"
    ValidationExpression="^\d{6}$" />
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label style="color: #FFFFFF;">Full Address</label>
            <div class="form-group">
                <asp:TextBox cssClass="form-control" ID="AddressTextBox" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ControlToValidate="AddressTextBox" ForeColor="#FF5733"  Font-Bold="true" 
    ErrorMessage="Full Address is required."  Display="Dynamic" />
            </div>
        </div>

        <!-- Login Credentials Section -->
        <div class="text-center mb-3">
            <span class="badge badge-pill badge-info p-2" style="font-size: 1rem; background-color: #8B4513; color: #ffffff;">Login Credentials</span>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label style="color: #FFFFFF;">User ID</label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="UserIDTextBox" runat="server" placeholder="User ID" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserIDValidator" runat="server"  ForeColor="#FF5733"  Font-Bold="true"  ControlToValidate="UserIDTextBox"     ErrorMessage="User ID is required."  Display="Dynamic" />
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label style="color: #FFFFFF;">Password</label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="PasswordTextBox" runat="server" placeholder="Password" TextMode="Password" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="PasswordTextBox"
    ErrorMessage="Password is required." ForeColor="#FF5733"  Font-Bold="true" Display="Dynamic"  />
<asp:RegularExpressionValidator ID="PasswordLengthValidator" runat="server" ControlToValidate="PasswordTextBox"
    ErrorMessage="Password must be at least 6 characters long." ForeColor="red" Display="Dynamic"
    ValidationExpression="^.{6,}$" />
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
                <a href="homepage.aspx" class="home-link" style=" text-decoration: none; font-weight: bold; display: block; text-align: right; margin-top: 10px;">Back to Home</a>
        </div>
    </div>
    <br />

</div>




    
       <style>




   /* Importing a modern font */

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Light.woff2') format('woff2'),
         url('fonts/Poppins-Light.woff') format('woff');
    font-weight: 300;
    font-style: normal;
}

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Regular.woff2') format('woff2'),
         url('fonts/Poppins-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-SemiBold.woff2') format('woff2'),
         url('fonts/Poppins-SemiBold.woff') format('woff');
    font-weight: 600;
    font-style: normal;
}

body {
    font-family: 'Poppins', sans-serif;
}






/* General Button Styling */
/* Updated Button Styling */
.btn {
    background: linear-gradient(135deg, #ff6600, #cc4400); /* Orange Gradient */
    color: #ffffff;
    padding: 12px 20px;
    font-size: 1.1rem;
    font-weight: 600;
    text-transform: uppercase;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    width: 100%;
}

/* Button Hover Effect */
.btn:hover {
    background: linear-gradient(135deg, #cc4400, #aa3300); /* Darker Orange */
    transform: scale(1.05);
    box-shadow: 0 12px 20px rgba(0, 0, 0, 0.4);
}

 /* Forgot Password & Back to Home Links */
 a.home-link {
    color: #40C4FF; /* Light Blue */
    text-decoration: none;
    font-weight: bold;
    display: block;
    text-align: right;
    margin-top: 10px;
    transition: color 0.3s ease-in-out;
}

/* Hover Effect */
 a.home-link:hover {
    color: #FFC107; /* Soft Yellow */
    text-decoration: underline;
}


    /* Attractive hover effect */
    .form-group a {
        text-decoration: none;
    }


/* Updated TextBox Styling */
.form-control {
    font-size: 1rem;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s ease-in-out;
}

/* Focus Effect for Inputs */
.form-control:focus {
    border-color: #005792;
    box-shadow: 0 0 10px rgba(0, 87, 146, 0.3);
}

/* Labels Styling */
label {
    font-size: 1rem;
    font-weight: 600;
    color: #ffffff;
    letter-spacing: 0.5px;
}

/* Title Styling */
h3 {
    font-size: 1.8rem;
    font-weight: bold;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}





.container {
    width: 50%;
    max-width: 700px;
    background: rgba(74, 123, 168, 0.7); /* Blue with transparency */
    border-radius: 0px; /* Slightly rounded corners */
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.5); /* Increased shadow for a 3D effect */
    padding: 30px;
    margin: 20px auto;
    color: #ffffff;
    backdrop-filter: blur(8px); /* Adds a glassmorphic effect */
}



    .bg-container {
    position: relative;
    min-height: 90vh;
    background-image: url('img2/S1.jpg');
    background-size: cover;
    background-position: center;
    font-family: Arial, sans-serif;
}

.bg-container::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    background: rgba(0, 0, 0, 0.5); /* Adds a dark overlay */
}

.container {
    position: relative;
    z-index: 2; /* Ensures content appears above the overlay */
}

</style>




    





  









</asp:Content>
