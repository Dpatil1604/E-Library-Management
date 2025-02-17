<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutuspage.aspx.cs" Inherits="LibraryWeb1.aboutuspage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <!--about us start-->    
<div class="background-image">
<!-- About Header Section -->
    <section class="about-header">
        <h1>About Us</h1>
        <p><a href="homepage.aspx">Home</a> / About Us</p>
    </section></div>



    <br />
     <br />
         <!--our story start-->
         <section class="our-story">
        <div class="container">
            <div class="text-content">
                <h2>OUR STORY</h2>
                <p>
                    Driven by a commitment to democratizing access to knowledge, E-Library was
                    established to address the evolving needs of learners in the digital age.  
                    This platform seamlessly integrates cutting-edge technology with the enduring 
                    values of librarianship, offering a comprehensive resource hub for students, 
                    educators, researchers, and avid readers.  E-Library empowers users to pursue 
                    intellectual growth and exploration at their own pace.  Boasting an extensive 
                    collection and intuitive interface, it is designed to foster lifelong learning.
                </p>
            </div>
            <div class="image-content">
                <img src="img2/Ab1.jpeg" alt="About 1" style="width: 370px; height: 402px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
         transition: transform 0.3s ease; cursor: pointer;" 
         onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'"/>
            </div>
        </div>
       </section>
        <!--our story end-->
        <br />
        <!--our mission start-->

     <section class="our-Mission">
        <div class="container">
            <div class="text-content">
                <h2>OUR MISSON</h2>
                <p>We envision a world where knowledge is freely accessible to all.  
                    We're dedicated to empowering users by providing vast resources, 
                    cutting-edge tools, and innovative services for academic success,
                    professional growth, and lifelong learning.  We aim to build an inclusive, 
                    user-friendly platform that inspires curiosity and bridges the gap between 
                    knowledge and its seekers.</p>

            </div>
            <div class="image-content">
                <img src="img2/Ab2.png" alt="About 2"  style="width: 370px; height: 402px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
         transition: transform 0.3s ease; cursor: pointer;" 
         onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'"/>
            </div>
        </div>
       </section>









           
        <!--our mission end-->
        <br />
  <!-- Our Team Section -->
  <!-- Our Team Section -->
<section class="team-section">
    <br />
    <h2 class="section-title">ALL MEMBERS</h2>

    <!-- First Row: 3 Members -->
    <div class="team-slider">
        <div class="team-member">
            <img src="img1/a2.jpeg" alt="Noah Carter">
            <h3>Noah Carter</h3>
            <p>Principal</p>
        </div>

        <div class="team-member">
            <img src="img1/a5..jpg" alt="Ms. Tara Joshi">
            <h3>Sophia Harper</h3>
            <p>Head of Library</p>
        </div>

        <div class="team-member">
            <img src="img1/a4.jpeg" alt="Mr. Liam Shah">
            <h3>Alexander Hayes</h3>
            <p>Library Operations Manager</p>
        </div>
    </div>

    <!-- Second Row: 2 Members -->
    <div class="team-slider row-2">
        <div class="team-member">
            <img src="img1/a1...jpg" alt="Ms. Maya Choudhury">
            <h3>Ella James</h3>
            <p>Digital Collections Specialist</p>
        </div>

        <div class="team-member">
            <img src="img1/a6.jpeg" alt="Ms. Aanya Desai">
            <h3>Amelia Harper</h3>
            <p>User Experience Specialist</p>
        </div>
    </div>
</section>


      





        <br />
        <!--connect start-->
        <br />
        <!--connect start-->
        <div class="contact-section">
    <div class="left-content">
        <h2>Contact Us</h2>
        <p>Have questions or need assistance? Reach out to us. We're here to help and enhance your reading experience.</p>
    </div>
    <div class="right-content">
        <h3>Get in Touch</h3>
        <p>We're always happy to hear from you! Drop us an email, and we'll get back to you as soon as possible.</p>
        <div class="email">
            <a href="mailto:greenfieldlibrary04@gmail.com">greenfieldlibrary04@gmail.com</a>
        </div>
    </div>
            <br />
            <br />
</div>



<!-- Additional Styling for Hover Effects -->
<style>


   /* Importing Poppins font locally */
@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Regular.woff2') format('woff2'),
         url('fonts/Poppins-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: 'Poppins';
    src: url('fonts/Poppins-Bold.woff2') format('woff2'),
         url('fonts/Poppins-Bold.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.about-header {
    position: relative;
    background-image: url('img1/about us back.png'); /* Correct way to define the image */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    height: 250px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #111;
    overflow: hidden;
}

.about-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* Overlay with dark tone */
    z-index: 1;
}

.about-header h1,
.about-header p {
    position: relative;
    z-index: 2;
}

.about-header h1 {
    font-size: 48px;
    font-weight: 700;
    color: white;
}

.about-header p {
    font-size: 18px;
    color: #ccc;
}

.about-header p a {
    text-decoration: none;
    color: #ccc;
    font-weight: 500;
    transition: color 0.3s;
}

.about-header p a:hover {
    color: #ffcc00;
}


/* Our Story Section */
 /* Our Story and Our Mission Sections */
    .our-story,
    .our-Mission {
        padding: 50px 80px;
        background-color: #fff;
    }

.container {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.text-content {
    width: 50%;
}

.text-content h2 {
    font-size: 32px;
    font-weight: 700;
    color: #111;
    margin-bottom: 15px;
}

.text-content p {
    font-size: 18px;
    color: #666;
    line-height: 1.6;
}

.image-content {
    width: 45%;
}

.image-content img {
    width: 100%;
    border-radius: 5px;
}

/* Contact Section */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #fff;
    text-align: center;
}

/* Section Title */
.section-title {
    font-size: 32px;
    font-weight: 700;
    margin: 50px 0 30px;
    color: #111;
}

/* Team Section */
.team-slider {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 20px;
    overflow: hidden;
    padding: 20px;
}

/* Team Member Card */
.team-member {
    text-align: center;
    width: 250px;
}

.team-member img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 5px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.team-member img:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.team-slider {
    display: flex;
    gap: 10px;
    justify-content: center;
}

.team-member h3 {
    font-size: 20px;
    font-weight: 700;
    margin-top: 10px;
    color: #111;
}

.team-member p {
    font-size: 16px;
    color: #666;
    font-style: italic;
}

/* Social Icons */
.social-icons {
    margin-top: 10px;
}

.social-icons i {
    font-size: 14px;
    margin: 5px;
    color: #666;
    cursor: pointer;
}

.social-icons i:hover {
    color: #007BFF;
}

/* Team Container */
.team-container {
    background-color: #FFE4C4;
    padding: 40px;
    border-radius: 12px;
}

/* Section Heading */
.team-heading {
    font-family: 'Roboto', sans-serif;
    color: #FF6F61;
    font-size: 2.5em;
    margin-bottom: 30px;
    padding-bottom: 10px;
    border-bottom: 4px solid #FF6F61;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Card Container */
.team-card {
    background-color: #F9F5F1;
    border: 2px solid #E0D6D1;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    margin: 10px 0;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.team-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
}

/* Profile Images */
.team-image {
    width: 160px;
    height: 160px;
    border-radius: 50%;
    transition: transform 0.3s ease;
    cursor: pointer;
}

.team-image:hover {
    transform: scale(1.1);
}

/* Name Styling */
.team-name {
    color: #5A3E36;
    font-weight: bold;
    margin-top: 15px;
    font-size: 1.2em;
}

/* Description Text */
.team-description {
    color: #4F4F4F;
    text-align: justify;
    font-size: 0.9em;
    line-height: 1.6;
    margin-top: 10px;
}

/* Background Image */
//.background-image {
  //  display: flex;
    //justify-content: center;
    //align-items: center;
    //min-height: 55vh;
   //background-image: url('img1/A3.png') ;
    //background-size: cover;
    //background-position: center;
    //font-family: Arial, sans-serif;
//} 

/* Contact Section Styles */
.contact-section {
   // background:   linear-gradient(135deg, #e6f7ff, #ffffff) ;
    color: #ffffff;
    text-align: center;
    padding: 60px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 30px;
}

.contact-section .left-content {
    text-align: left;
    flex: 1;
}

.contact-section .left-content h2 {
    font-size: 2.5rem;
    font-weight: 700;
    color: #ffd700;
}

.contact-section .left-content p {
    font-size: 1.2rem;
    margin-top: 15px;
    line-height: 1.8;
    background: linear-gradient(135deg, #0d1b2a, #1b263b); /* Gradient */
    -webkit-background-clip: text; /* Clip the background to the text */
    -webkit-text-fill-color: transparent; /* Make the rest of the text transparent */
}


.contact-section .right-content {
    background: #ffffff;
    color: #1b263b;
    flex: 1;
    text-align: left;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.contact-section .right-content h3 {
    font-size: 2rem;
    font-weight: bold;
    margin-bottom: 15px;
}

.contact-section .right-content p {
    font-size: 1rem;
    margin-bottom: 20px;
    color: #555;
}

.contact-section .right-content .email {
    font-size: 1.2rem;
    font-weight: bold;
    color: #007bff;
    text-decoration: none;
    border-bottom: 2px solid #ffd700;
    padding-bottom: 2px;
    transition: color 0.3s, border-bottom-color 0.3s;
}

.contact-section .right-content .email:hover {
    color: #ffcc00;
    border-bottom-color: #ffcc00;
}




/* Enhanced Shadow Effect for Every Section Except .about-header and for .contact-section */
section:not(.about-header),
.contact-section {
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.3); /* Increased shadow intensity */
    border-radius: 12px; /* Slightly more rounded corners */
    margin: 25px 0;
}





</style>

</asp:Content>
