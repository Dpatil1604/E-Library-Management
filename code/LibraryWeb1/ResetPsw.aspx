<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPsw.aspx.cs" Inherits="LibraryWeb1.ResetPsw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- jQuery CDN -->
    


    <script src="bootstrap/js/jquery-3.6.0.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome/css/all.min.css" rel="stylesheet" />
    
    <style>
        .reset-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('img2/s3.jpg') no-repeat center center/cover; /* Background image */
            padding: 20px;
            position: relative;
        }

        .reset-container::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay for readability */
            backdrop-filter: blur(5px); /* Soft blur effect */
            -webkit-backdrop-filter: blur(5px);
        }

        .reset-password-card {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 450px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.98); /* Slight transparency */
            text-align: center;
            border-radius: 0px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .reset-password-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 12px 24px rgba(0, 0, 0, 0.2);
        }

        .reset-password-card h3 {
            font-size: 22px;
            font-weight: bold;
            color: #000;
            text-transform: uppercase;
        }

        .reset-password-card p {
            font-size: 14px;
            color: #6c757d;
            margin-bottom: 20px;
        }

        .input-group {
            border: 1px solid #ced4da;
            border-radius: 5px;
            overflow: hidden;
            background: #f8f9fa;
            box-shadow: inset 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-group-text {
            background: transparent;
            border: none;
            font-size: 18px;
            color: #6c757d;
        }

        .form-control {
            border: none;
            font-size: 16px;
            height: 45px;
            background: transparent;
        }

        .btn-submit {
            background: #4169E1; /* Royal Blue */
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            height: 45px;
            width: 100%;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease-in-out;
        }

        .btn-submit:hover {
            background: #5A8DEE; /* Lighter Royal Blue on hover */
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
            transform: scale(1.05);
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container reset-container">
        <div class="reset-password-card">
            <h3>Reset Password</h3>
            <p>Please kindly set your new password.</p>

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <asp:TextBox ID="npt" runat="server" CssClass="form-control" TextMode="Password" placeholder="New password" />
            </div>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="npt" ErrorMessage="Password is required!" ForeColor="Red" Display="Dynamic" />

            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <asp:TextBox ID="cpt" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter password" />
            </div>
            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="cpt" ErrorMessage="Please confirm your password!" ForeColor="Red" Display="Dynamic" />
            <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToCompare="npt" ControlToValidate="cpt" ErrorMessage="Passwords do not match!" ForeColor="Red" Display="Dynamic" />

            <asp:Button ID="btnReset" runat="server" CssClass="btn-submit" Text="Reset Password" OnClick="btnReset_Click" />
        </div>
    </div>
    <br />
</asp:Content>
