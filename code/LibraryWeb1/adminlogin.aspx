<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="LibraryWeb1.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
   

    <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; background-image: url('img2/bg2.png'); background-size: cover; background-position: center; font-family: Arial, sans-serif; position: relative;">
    <!-- Dark Overlay Effect -->
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4);"></div>

<div class="container" style="display: flex; align-items: center; justify-content: space-between; width: 55%; max-width: 700px; background-color: rgba(227, 242, 253, 0.4); border-radius: 0px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); padding: 20px; margin: 20px; color: #333333; backdrop-filter: blur(10px); position: relative;">
        <!-- Illustration Section -->
        <div class="illustration" style="flex: 1; text-align: center; padding: 20px;">
            <img src="img2/l4.png" alt="Illustration" style="width: 100%; max-width: 300px; height: auto; filter: drop-shadow(2px 2px 10px rgba(0, 0, 0, 0.2));" />
        </div>
        <!-- Member Login Form Section -->
        <div class="login-form" style="flex: 1; padding: 20px;">
            <div style="text-align: center; margin-bottom: 20px;">
                <h3 style="color: #f0f0f0;">Admin Login</h3>
            </div>
            <hr style="border-color: #f0f0f0;" />
            <div style="margin-top: 20px;">
                <label for="memberId" style="display: block; margin-bottom: 5px; color:#e0e0e0;">Admin ID</label>


                <div class="form-group">
                        <asp:TextBox cssClass="form-control" ID="MemberTextBox1" runat="server" placeholder="Admin ID" style="width: 100%; padding: 12px; border:1px solid #ccc; border-radius: 5px; margin-bottom: 15px; background: rgba(255, 255, 255, 0.6); color: black"  />
                 <!-- Validation for Admin ID -->
                    <asp:RequiredFieldValidator ID="rfvAdminID" runat="server" ControlToValidate="MemberTextBox1"
                        ErrorMessage="Admin ID is required." ForeColor="#FFC107"  Font-Bold="true" Display="Dynamic" />    
                </div>
                
                <label for="password" style="display: block; margin-bottom: 5px; color: #e0e0e0;">Password</label>


                <div class="form-group">
                        <asp:TextBox cssClass="form-control" ID="PasswordTextBox2" runat="server" placeholder="Password" TextMode="Password" style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px; background: rgba(255, 255, 255, 0.5); color: black; " />
                   
                <!-- Validation for Password -->
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="PasswordTextBox2"
                        ErrorMessage="Password is required." ForeColor="#FFC107"  Font-Bold="true" Display="Dynamic" />    
                </div>



                <div class="form-group">
                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button2" runat="server" Text="Login" style="background-color: #007bff; color: white; border: none; padding: 12px 20px; border-radius: 0px; font-size: 18px; width: 100%; " OnClick="MemberLoginButton_Click" />
                    </div>

                
               
                
                <!-- Back to Home Link -->
                <a href="homepage.aspx" class="home-link" style=" text-decoration: none; font-weight: bold; display: block; text-align: right; margin-top: 10px;">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<style>




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
    /* Improve text visibility */
h3 {
    color: white; 
    font-weight: bold;
}

/* Form label styling */
label {
    color: #f8f9fa;
}

/* Enhance input fields */
input[type="text"], input[type="password"] {
    background: rgba(255, 255, 255, 0.8);
    color: black;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
}

/* Button styling */
.btn {
    transition: all 0.3s ease-in-out;
}

.btn-primary {
    background-color: #1E90FF;
    color: white;
}

.btn-primary:hover {
    background-color: #007bff;
}

.btn-accent {
    background-color: #FF7F50;
    color: white;
}

.btn-accent:hover {
    background-color: #ff5722;
}





/* Smooth hover effect */
.btn:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

</style>
























     
</asp:Content>
