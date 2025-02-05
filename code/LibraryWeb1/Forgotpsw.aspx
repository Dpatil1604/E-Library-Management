<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Forgotpsw.aspx.cs" Inherits="LibraryWeb1.Forgotpsw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .forgot-password-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }
        .forgot-password-card {
            width: 550px;
            height:auto;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: white;
            text-align: center;
        }
        .forgot-password-card h3 {
            font-size: 24px;
            font-weight: bold;
        }
        .forgot-password-card p {
            font-size: 14px;
            color: #6c757d;
        }
        .forgot-password-card .form-control {
            height: 45px;
            font-size: 16px;
        }
        .forgot-password-card .btn {
            height: 45px;
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container forgot-password-container">
        <div class="forgot-password-card">
            <h3>Forgot Password</h3>
            <p>Enter your email to reset your password</p>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email" TextMode="Email"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Reset Password" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" />
            <div class="text-center mt-3">
                <a href="homepage.aspx">Back to Home</a>
            </div>
        </div>
    </div>
</asp:Content>
