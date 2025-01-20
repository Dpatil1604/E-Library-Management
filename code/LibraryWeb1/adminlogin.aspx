<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="LibraryWeb1.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; background-image: url('img2/bg2.png'); background-size: cover; background-position: center; font-family: Arial, sans-serif;">
    <div class="container" style="display: flex; align-items: center; justify-content: space-between; width: 55%; max-width: 700px; background-color: #FFFFE0; border-radius: 4px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3); padding: 30px; margin: 20px; color: #333333;">
        <!-- Illustration Section -->
        <div class="illustration" style="flex: 1; text-align: center; padding: 20px;">
            <img src="img2/l4.png" alt="Illustration" style="width: 100%; max-width: 400px; height: auto;" />
        </div>
        <!-- Member Login Form Section -->
        <div class="login-form" style="flex: 1; padding: 20px;">
            <div style="text-align: center; margin-bottom: 20px;">
                <h3 style="color: #333333;">Admin Login</h3>
            </div>
            <hr style="border-color: #8B4513;" />
            <div style="margin-top: 20px;">
                <label for="memberId" style="display: block; margin-bottom: 5px; color: #333333;">Admin ID</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="MemberTextBox1" runat="server" placeholder="Member ID" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;" />
                </div>
                <label for="password" style="display: block; margin-bottom: 5px; color: #333333;">Password</label>
                <div class="form-group">
                    <asp:TextBox cssClass="form-control" ID="PasswordTextBox2" runat="server" placeholder="Password" TextMode="Password" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 15px;" />
                </div>
                <div class="form-group">
                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="MemberLoginButton" runat="server" Text="Login" style="background-color: #1E90FF; color: white; border: none; padding: 12px 20px; border-radius: 5px; font-size: 16px; width: 100%;" OnClick="MemberLoginButton_Click" />
                </div>
               
                </div>
                <!-- Forgot Password Link -->
                <div style="text-align: right; margin-top: 10px;">
                    <a href="#" style="color: #1E90FF; text-decoration: none; font-weight: bold;">Forgot Password?</a>
                </div>
                <!-- Back to Home Link -->
                <a href="homepage.aspx" style="color: #1E90FF; text-decoration: none; font-weight: bold; display: block; text-align: right;  margin-top: 10px;">Back to Home</a>
                <br />
            </div>
        </div>
    </div>

<style>
    /* Attractive hover effect */
    
    .btn:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .btn-accent:hover {
        background-color: #e67600;
    }
</style>
</asp:Content>
