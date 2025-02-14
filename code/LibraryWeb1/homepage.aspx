<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="LibraryWeb1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!--<section>
       <img src="img1/p1.jpeg" class="img-fluid" width="1920" height="100" >
    </section>
    <section>
    <div class="container">
        <div class="row">
        <div class="col-12">
            <center>
                <h2>Our Features</h2>
                <p><b>Our 3 Primary Features-</b></p>
            </center>

        </div>
        </div>

        <div class="row">
        <div class="col-md-4">
        <center>
       <img width="150px" src="img/digital-inventory.png" />
        <h4>Digital Book Inventory</h4>
        <p class="text-justify">The Digital Book Inventory streamlines library management with easy cataloging,
            quick searches, and real-time availability updates, plus alerts for due dates and 
            access to digital resources.It improves accessibility and enhances the user experience.</p>
        </center>
        </div>

            <div class="col-md-4">
        <center>
        <img width="150px" src="img/search-online.png" />
        <h4>Search Books</h4>
        <p class="text-justify">The Search Books feature allows users to quickly find books by title, author or keywords, 
            providing filtered results for easy browsing.This enhances the library experience by saving time and helping 
            users locate resources efficiently.</p>
        </center>
        </div>

            <div class="col-md-4">
        <center>
        <img width="150px" src="img1/dlist.png" />
        <h4>Defaulter List</h4>
        <p class="text-justify">The Defaulter List feature tracks users with overdue books, displaying their names, 
            due dates, and fines owed. This helps administrators manage late returns effectively and ensures timely
            reminders for users to avoid penalties.</p>
        </center>
        </div>
        </div>
    </div>
        </section>

    <section>
        <img src="img1/p1.jpeg" class="img-fluid" width="1920" height="200" />
    </section>
    <section>
    <div class="container">
        <div class="row">
        <div class="col-12">
            <center>
                <h2>Our Process</h2>
                <p><b>We have a Simple 3 Step Process</b></p>
            </center>

        </div>
        </div>

        <div class="row">
        <div class="col-md-4">
        <center>
            <img width="150px" src="img1/sign%20up.png" />
        
        <h4>Sign Up</h4>
        <p class="text-justify">Create a personalized account to access our library’s extensive collection
            and exclusive features. Just fill in your basic details to register.Enjoy easy tracking of your
            borrowed books, due date alerts, and personalized recommendations!</center>
        </div>

            <div class="col-md-4">
        <center>
        <img width="150px" src="img/search-online.png" />
        <h4>Search Books</h4>
        <p class="text-justify">The Search Books feature allows users to quickly find books by title, author or keywords, 
            providing filtered results for easy browsing.This enhances the library experience by saving time and helping 
            users locate resources efficiently.</p>
        </center>
        </div>

            <div class="col-md-4">
        <center>
        <img width="150px" src="img/library.png" />
        <h4>Visit Us</h4>
        <p class="text-justify"> Drop by our library to explore our collection and services in person.
            Our team is here to assist you with any inquiries and help you find the resources you need!</p>
        </center>
        </div>
        </div>
    </div>
        </section>-->
    

   
   
  


  
  <!-- Bootstrap CSS -->
    

    <style>

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Regular.woff2') format('woff2'),
         url('fonts/Poppins-Regular.ttf') format('truetype');
    font-weight: 400;
}

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Bold.woff2') format('woff2'),
         url('fonts/Poppins-Bold.ttf') format('truetype');
    font-weight: 700;
}

/* General Styles */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fc;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Header Banner */
.header-banner {
    background: linear-gradient(135deg, #002147, #004aad);
    color: white;
    text-align: center;
    padding: 60px 20px;
    font-weight: 600;
}

.header-banner h1 {
    font-size: 2.8rem;
    margin-bottom: 10px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.header-banner p {
    font-size: 1.2rem;
    opacity: 0.85;
}

/* Section Headers */
.section-header {
    text-align: center;
    margin-bottom: 40px;
    color: #002147;
    font-size: 1.8rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
}

.section-header p {
    font-size: 1.1rem;
    font-weight: 400;
    color: #555;
    max-width: 600px;
    margin: 10px auto 0;
    line-height: 1.5;
}

/* Add an underline effect */
.section-header h2::after {
    content: "";
    display: block;
    width: 80px;
    height: 3px;
    background: #004aad;
    margin: 10px auto 0;
    border-radius: 5px;
}

/* Container */
.container {
    padding: 50px 10%;
}

/* Card Styles */
.card {
    background: white;
    border-radius: 15px;
    padding: 20px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
    color: #002147;
}

.card img {
    max-width: 100px;
    margin: 0 auto 15px;
    display: block;
    transition: transform 0.3s ease, filter 0.3s ease;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    background: linear-gradient(135deg, #002147, #004aad);
    color: white;
}

.card:hover img {
    transform: scale(1.1);
    filter: brightness(1.2);
}

.card-title {
    font-size: 1.4rem;
    font-weight: 600;
    margin: 15px 0;
}

.card-text {
    font-size: 0.95rem;
    line-height: 1.5;
}

/* Join Us Section */
.join-us {
    background: #004aad;
    color: white;
    text-align: center;
    padding: 50px;
    margin: 50px 0;
}

.join-us h2 {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 10px;
}

.join-us p {
    font-size: 1.2rem;
    opacity: 0.9;
}

/* Unified Image Styling */
.sign-up-img, .visit-us-img, .search-books-img, .defaulter-list-img {
    width: 100px;
    height: auto;
    display: block;
    margin: 0 auto;
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        padding: 30px 5%;
    }

    .header-banner h1 {
        font-size: 2.2rem;
    }

    .card {
        padding: 20px;
    }
}

    </style>


    <!-- Header Section -->
    <header class="header-banner">
        <h1>Welcome to Our Library Management System</h1>
        <p>Manage Books, Search Easily, and Enjoy Reading</p>
    </header>

    <!-- Features Section -->
    <section class="container">
        <div class="section-header">
            <h2>Our Features</h2>
            <p>Discover the key features that make our library system efficient and user-friendly.</p>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="img/digital-inventory.png" alt="Digital Inventory" class="img-fluid">
                    <h4 class="card-title">Digital Book Inventory</h4>
                    <p class="card-text">Enhance library efficiency with seamless cataloging, advanced search functionality.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="img/search-online.png" alt="Search Books"class="img-fluid">
                    <h4 class="card-title">Search Books</h4>
                    <p class="card-text">Discover books effortlessly by title, author, or keywords with **advanced** filters for seamless browsing and maximum convenience.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="img1/dlist.png" alt="Defaulter List" class="img-fluid defaulter-list-img">
                    <h4 class="card-title">Defaulter List</h4>
                    <p class="card-text">Maintain an organized defaulter list with accurate tracking, ensuring accountability and efficient library management.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Join Us Section -->
    <section class="join-us">
        <h2>Join Our Library</h2>
        <p>Become a member today and explore a vast collection of books, research materials, and exclusive events.</p>
    </section>

    <!-- How It Works Section -->
    <section class="container my-5">
        <div class="section-header">
            <h2>How It Works</h2>
            <p>Our library management system is designed to make your reading experience smooth and hassle-free. Follow these simple steps to get started!</p>

        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="img1/sign%20up.png" alt="Sign Up" class="img-fluid sign-up-img">
                    <h4 class="card-title">Sign Up</h4>
                    <p class="card-text">Create a personalized account to seamlessly access our library’s extensive collection, exclusive resources, and features.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="img/search-online.png" alt="Search Books" class="img-fluid search-books-img">
                    <h4 class="card-title">Search Books</h4>
                    <p class="card-text">Easily locate books with advanced filters and recommendations for a seamless and efficient library experience.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="img/library.png" alt="Visit Us" class="img-fluid visit-us-img">
                    <h4 class="card-title">Visit Us</h4>
                    <p class="card-text">Visit our library to discover our extensive literary collection and benefit from specialized and professional expert assistance.</p>
                </div>
            </div>
        </div>
    </section>



    <!-- Bootstrap JS -->
    
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    </asp:Content>