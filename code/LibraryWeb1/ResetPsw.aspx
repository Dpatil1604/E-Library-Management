<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPsw.aspx.cs" Inherits="LibraryWeb1.ResetPsw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .reset-container {
            text-align: center;
            width: 350px;
            margin: 50px auto;
            font-family: Arial, sans-serif;
        }
        .input-box {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn-submit {
            background-color: #FF5722;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #E64A19;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="reset-container">
        <h2>Reset password</h2>
        <p>Please kindly set your new password.</p>

        <asp:TextBox ID="npt" runat="server" CssClass="input-box" TextMode="Password" placeholder="New password" />
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="npt" 
            ErrorMessage="Password is required!" ForeColor="Red" Display="Dynamic" />

        <asp:TextBox ID="cpt" runat="server" CssClass="input-box" TextMode="Password" placeholder="Re-enter password" />
        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="cpt" 
            ErrorMessage="Please confirm your password!" ForeColor="Red" Display="Dynamic" />

        <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToCompare="npt" ControlToValidate="cpt" 
            ErrorMessage="Passwords do not match!" ForeColor="Red" Display="Dynamic" />

        <asp:Button ID="btnReset" runat="server" CssClass="btn-submit" Text="Reset Password" OnClick="btnReset_Click" />
    </div>
</asp:Content>
