<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="LibraryWeb1.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <!-- <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="img2/user.png" />
                                </center>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
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
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control" ID="TextBox1" runat="server"  placeholder="Member ID"></asp:TextBox>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox cssClass="form-control"  ID="TextBox2" runat="server"   placeholder="Password"  TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-success  btn-block  btn-lg" ID="Button1" runat="server" Text="Login" />
                                </div>

                                <div class="form-group">
                                   <a href="usersignup.aspx"><input class="btn btn-info  btn-block btn-lg" id="Button2" type="button" value="Sign Up"  /></a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>-->


   
 <!--<div style="
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color:    #d2eee8;
        font-family: Arial, sans-serif;
    ">
        <div style="
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 380px;
            text-align: center;
        ">
            <h2 style="
                margin-bottom: 20px;
                color: #343a40;
                font-weight: bold;
            ">Member Login</h2>
            <img src="img2/user.png" alt="User Icon" width="90" style="
                margin-bottom: 20px;
            ">
            <div style="text-align: left;">
                <label for="memberId" style="
                    display: block;
                    margin-bottom: 5px;
                    font-weight: 600;
                    color: #555;
                ">Member ID</label>
                <input type="text" id="memberId" placeholder="Enter Member ID" style="
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    margin-bottom: 15px;
                    outline: none;
                    transition: border-color 0.3s;
                " onfocus="this.style.borderColor='#007bff'" onblur="this.style.borderColor='#ccc'">
                
                <label for="password" style="
                    display: block;
                    margin-bottom: 5px;
                    font-weight: 600;
                    color: #555;
                ">Password</label>
                <input type="password" id="password" placeholder="Enter Password" style="
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    margin-bottom: 15px;
                    outline: none;
                    transition: border-color 0.3s;
                " onfocus="this.style.borderColor='#007bff'" onblur="this.style.borderColor='#ccc'">
            </div>

            <button type="submit" style="
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 12px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s;
            " onmouseover="this.style.backgroundColor='#0056b3'" onmouseout="this.style.backgroundColor='#007bff'">Login</button>
            <a href="usersignup.aspx" style="
                display: block;
                text-align: center;
                margin-top: 15px;
                color: #007bff;
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s;
            " onmouseover="this.style.color='#0056b3'" onmouseout="this.style.color='#007bff'">Sign Up</a>

            <div style="margin-top: 20px;">
                <a href="homepage.aspx" style="
                    color: #007bff;
                    text-decoration: none;
                    font-weight: 600;
                    transition: color 0.3s;
                " onmouseover="this.style.color='#0056b3'" onmouseout="this.style.color='#007bff'">&lt;&lt; Back to Home</a><br /><br />
            </div>
        </div>
    </div>-->


  <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; background-image: url('img2/bg2.png'); background-size: cover; background-position: center; font-family: Arial, sans-serif; position: relative;">
    <!-- Dark Overlay Effect -->
    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4);"></div>

<div class="container" style="display: flex; align-items: center; justify-content: space-between; width: 55%; max-width: 700px; background-color: rgba(227, 242, 253, 0.4); border-radius: 0px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); padding: 20px; margin: 20px; color: #333333; backdrop-filter: blur(10px); position: relative;">
        <!-- Illustration Section -->
        <div class="illustration" style="flex: 1; text-align: center; padding: 20px;">
            <img src="img2/l2.png" alt="Illustration" style="width: 100%; max-width: 300px; height: auto; filter: drop-shadow(2px 2px 10px rgba(0, 0, 0, 0.2));" />
        </div>
        <!-- Member Login Form Section -->
        <div class="login-form" style="flex: 1; padding: 20px;">
            <div style="text-align: center; margin-bottom: 20px;">
                <h3 style="color: #f0f0f0;">Member Login</h3>
            </div>
            <hr style="border-color: #f0f0f0;" />
            <div style="margin-top: 20px;">
                <label for="memberId" style="display: block; margin-bottom: 5px; color:#e0e0e0;">Member ID</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="MemberTextBox1" runat="server" placeholder="Member ID" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px; background: rgba(255, 255, 255, 0.6); color: black;" />
                </div>
                <label for="password" style="display: block; margin-bottom: 5px; color: #e0e0e0;">Password</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="PasswordTextBox2" runat="server" placeholder="Password" TextMode="Password" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px; background: rgba(255, 255, 255, 0.6); color: black;" />
                </div>
                <div class="form-group">
                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="MemberLoginButton" runat="server" Text="Login" style="background-color: #007bff; color: white; border: none; padding: 12px 20px; border-radius: 0px; font-size: 18px; width: 100%;" OnClick="MemberLoginButton_Click" />
                </div>
                <!-- Sign Up Button -->
                <div class="form-group">
                    <a href="usersignup.aspx">
                        <input class="btn btn-accent btn-block btn-lg" id="Button2" type="button" value="Sign Up" style="background-color: #ff7043; color: white; border: none; padding: 12px 20px; border-radius: 0px; font-size: 18px; width: 100%;" />
                    </a>
                </div>
                <!-- Forgot Password Link -->
                <div style="text-align: right; margin-top: 10px;">
                    <a href="Forgotpsw.aspx" class="forgot-link"  style =" text-decoration: none; font-weight: bold;">Forgot Password?</a>
                </div>
                <!-- Back to Home Link -->
                <a href="homepage.aspx" class="home-link" style=" text-decoration: none; font-weight: bold; display: block; text-align: right; margin-top: 10px;">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<style>




    /* Forgot Password & Back to Home Links */
a.forgot-link, a.home-link {
    color: #40C4FF; /* Light Blue */
    text-decoration: none;
    font-weight: bold;
    display: block;
    text-align: right;
    margin-top: 10px;
    transition: color 0.3s ease-in-out;
}

/* Hover Effect */
a.forgot-link:hover, a.home-link:hover {
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
