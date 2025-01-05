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



   
    <style>
    /* Hover effect for images */
    .hover-img:hover {
        transform: scale(1.1);
        transition: transform 0.3s ease;
    }
    
    /* Hover effect for titles */
    .hover-title:hover {
        color: #007bff;
        transition: color 0.3s ease;
    }

    /* Hover effect for paragraphs */
    .hover-text:hover {
        color: #555;
        transition: color 0.3s ease;
    }
</style>

<section>
    <img src="img1/p1.jpeg" class="img-fluid" width="1920" height="100">
</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2 class="hover-title">Our Features</h2>
                    <p><b>Our 3 Primary Features-</b></p>
                </center>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <center>
                    <img width="150px" src="img/digital-inventory.png" class="hover-img" />
                    <h4 class="hover-title">Digital Book Inventory</h4>
                    <p class="text-justify hover-text">The Digital Book Inventory streamlines library management with easy cataloging,
                        quick searches, and real-time availability updates, plus alerts for due dates and 
                        access to digital resources. It improves accessibility and enhances the user experience.</p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="150px" src="img/search-online.png" class="hover-img" />
                    <h4 class="hover-title">Search Books</h4>
                    <p class="text-justify hover-text">The Search Books feature allows users to quickly find books by title, author, or keywords, 
                        providing filtered results for easy browsing. This enhances the library experience by saving time and helping 
                        users locate resources efficiently.</p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="150px" src="img1/dlist.png" class="hover-img" />
                    <h4 class="hover-title">Defaulter List</h4>
                    <p class="text-justify hover-text">The Defaulter List feature tracks users with overdue books, displaying their names, 
                        due dates, and fines owed. This helps administrators manage late returns effectively and ensures timely
                        reminders for users to avoid penalties.</p>
                </center>
            </div>
        </div>
    </div>
</section>
<section>
    <img src="img2/bb1.png"  class="img-fluid custom-img" style="height: 250px;" width="1900">
</section>



<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2 class="hover-title">Our Process</h2>
                    <p><b>We have a Simple 3 Step Process</b></p>
                </center>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <center>
                    <img width="150px" src="img1/sign%20up.png" class="hover-img" />
                    <h4 class="hover-title">Sign Up</h4>
                    <p class="text-justify hover-text">Create a personalized account to access our library’s extensive collection
                        and exclusive features. Just fill in your basic details to register. Enjoy easy tracking of your
                        borrowed books, due date alerts, and personalized recommendations!</p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="150px" src="img/search-online.png" class="hover-img" />
                    <h4 class="hover-title">Search Books</h4>
                    <p class="text-justify hover-text">The Search Books feature allows users to quickly find books by title, author, or keywords, 
                        providing filtered results for easy browsing. This enhances the library experience by saving time and helping 
                        users locate resources efficiently.</p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="150px" src="img/library.png" class="hover-img" />
                    <h4 class="hover-title">Visit Us</h4>
                    <p class="text-justify hover-text">Drop by our library to explore our collection and services in person.
                        Our team is here to assist you with any inquiries and help you find the resources you need!</p>
                </center>
            </div>
        </div>
    </div>
</section>


</asp:Content>
