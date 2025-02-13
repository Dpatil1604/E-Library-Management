<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Forgotpsw.aspx.cs" Inherits="LibraryWeb1.Forgotpsw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
    .forgot-password-container {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: url('img2/s3.jpg') no-repeat center center/cover; /* Security-related image */
   
    padding: 20px;
    position: relative;
}

.forgot-password-container::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Dark overlay for readability */
    backdrop-filter: blur(5px); /* Soft blur effect */
    -webkit-backdrop-filter: blur(5px);
}

.forgot-password-card {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 450px;
    padding: 30px;
    background-color: rgba(255, 255, 255, 0.98);
    text-align: center;
    border-radius: 0px; /* Rounded corners */
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.forgot-password-card:hover {
    transform: translateY(-5px);
    box-shadow: 0px 12px 24px rgba(0, 0, 0, 0.2);
}

.forgot-password-card img {
    width: 70px;
    margin-bottom: 10px;
}

.forgot-password-card h3 {
    font-size: 22px;
    font-weight: bold;
    color: #000;
    text-transform: uppercase;
}

.forgot-password-card p {
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

.btn-next {
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

.btn-next:hover {
    background: #5A8DEE; /* Lighter Royal Blue on hover */
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
    transform: scale(1.05);
}


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container forgot-password-container">
        <div class="forgot-password-card">
            <img src="img1/lock.png" alt="Lock Icon" width="100" height="auto">
            <h3>Forget Password</h3>
            <p>Provide your account's email for which you want to reset your password!</p>
            
            <div class="input-group mb-3">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email"></asp:TextBox>
            </div>
            <!-- Validation Controls -->
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required!" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                ErrorMessage="Invalid email format!" ForeColor="Red" Display="Dynamic" />
            <asp:Button ID="btnSubmit" runat="server" Text="Next" CssClass="btn btn-next" OnClick="btnSubmit_Click" />
        </div>
    </div>
    <br />

</asp:Content>
