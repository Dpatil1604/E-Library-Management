<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutuspage.aspx.cs" Inherits="LibraryWeb1.aboutuspage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!--about us start-->
    
<div class="background-image">
<div class="container" style="background-color:#FFE4C4; padding: 50px; border-radius: 10px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); max-width: 900px; margin: 30px auto;">
    <div class="title" style="text-align: center; margin-bottom: 20px;">
        <h1 style="font-family: 'Georgia', serif; font-size: 2.5em; color: #FF6F61; border-bottom: 3px solid #FF6F61; display: inline-block; padding-bottom: 5px;">About Us</h1>
    </div>
    <p style="font-family: 'Arial', sans-serif; font-size: 1.2em; color: #3E2723; line-height: 1.8; text-align: justify;">
        Welcome to <strong>E-Library</strong> – your digital gateway to a world of knowledge and resources. Our Online Library Management System is designed to make accessing, managing, and exploring our extensive collection easier than ever before. Whether you're a student, researcher, or book lover, our platform offers a seamless and user-friendly experience to help you find exactly what you need.
    </p>

    </div></div>



    <br />
        <!--our story start-->
        <section class="py-3 py-md-5" style="background-color: #FFE4C4; padding: 40px; border-radius: 10px;">
    <div class="container">
        <div class="row gy-3 gy-md-4 gy-lg-0 align-items-lg-center">
            <!-- Image Column -->
           
         <div class="col-12 col-lg-6 col-xl-5">
    <img class="img-fluid rounded" loading="lazy" src="img2/Ab1.jpeg" alt="About 1" 
         style="width: 370px; height: 400px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
         transition: transform 0.3s ease; cursor: pointer;" 
         onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'"/>
</div>

            <!-- Text Column -->
            <div class="col-12 col-lg-6 col-xl-7">
                <div class="row justify-content-xl-center">
                    <div class="col-12 col-xl-11">
                        <h2 class="mb-3" style="font-family: 'Georgia', serif; font-size: 2em; color: #FF6F61; border-bottom: 3px solid #FF6F61; padding-bottom: 10px;">Our Story</h2>
                        
                        <p class="mb-5" style="font-family: 'Arial', sans-serif; color: #3E2723; line-height: 1.8; text-align: justify; font-size: 1.1em;">
                           
E-Library was founded with a passion for expanding access to knowledge. In today’s fast-paced digital age, we realized the need for a library that’s accessible beyond traditional walls and hours. This platform bridges that gap, combining technology with the rich tradition of libraries to provide a comprehensive resource hub for students, educators, researchers, and book lovers alike. It empowers users to explore, learn, and grow at their own pace. With a vast collection and intuitive interface, E-Library is designed to inspire lifelong learning.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
            

</section>
        </div>
       
        <!--our story end-->
        <br />
        <!--our mission start-->
            <section class="py-3 py-md-5" style="background-color: #FFE4C4; padding: 40px; border-radius: 10px;">
    <div class="container">
        <div class="row gy-3 gy-md-4 gy-lg-0 align-items-lg-center">
            <!-- Image Column -->
           <div class="col-12 col-lg-6 col-xl-5">
    <img class="img-fluid rounded" loading="lazy" src="img2/Ab2.png" alt="About 1" 
         style="width: 370px; height: 402px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
         transition: transform 0.3s ease; cursor: pointer;" 
         onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'"/>
</div>


            <!-- Text Column -->
            <div class="col-12 col-lg-6 col-xl-7">
                <div class="row justify-content-xl-center">
                    <div class="col-12 col-xl-11">
                        <h2 class="mb-3" style="font-family: 'Georgia', serif; font-size: 2em; color: #FF6F61; border-bottom: 3px solid #FF6F61; padding-bottom: 10px;">Our Mission</h2>
                        
                        <p class="mb-5" style="font-family: 'Arial', sans-serif; color: #3E2723; line-height: 1.8; text-align: justify; font-size: 1.1em;">
                          
We are driven by a vision of a world where access to knowledge is free from barriers and limitations, ensuring that learning opportunities are available to everyone, regardless of location or circumstance. Our mission is to empower our users by providing them with reliable access to a vast array of resources, cutting-edge tools, and innovative services that support academic success, professional growth, and lifelong learning. Through our commitment to excellence, we strive to create an inclusive, user-friendly platform that inspires curiosity, fosters intellectual growth, and bridges the gap between knowledge and its seekers.</p>
                        
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
        <!--our mission end-->
        <br />
  <!-- Our Team Section -->
<section>
  <div class="container team-container">
    <div class="row">
      <div class="col-12">
        <center>
          <h2 class="team-heading">Our Team</h2>
        </center>
      </div>
    </div>

    <div class="row">
      <!-- Team Member 1 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a2.jpeg" class="team-image" />
          <h4 class="team-name">Dr. Rajesh Kumar Singh, Principal</h4>
          <p class="team-description">Dr. Singh leads the institution with a vision for academic excellence and student success, ensuring that the library and educational resources meet the highest standards.</p>
        </div>
      </div>

      <!-- Team Member 2 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a3.jpeg" class="team-image" />
          <h4 class="team-name">Mrs. Ananya Mehta, Head of Library</h4>
          <p class="team-description">Mrs. Mehta oversees the library's resources and services, implementing new programs and digital tools that transform the library into an interactive and dynamic learning space.</p>
        </div>
      </div>

      <!-- Team Member 3 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a4.jpeg" class="team-image" />
          <h4 class="team-name">Mr. Liam Shah, Library Operations Manager</h4>
          <p class="team-description">Mr. Liam Shah, Library Operations Manager, oversees library operations, ensuring efficient cataloging, user support, and resource management, fostering innovation and accessibility in a dynamic environment.</p>
        </div>
      </div>
    </div>

    <div class="row">
      <!-- Team Member 4 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a1...jpg" alt="Maya Choudhury" class="team-image" />
          <h4 class="team-name">Ms. Maya Choudhury, Digital Collections Specialist</h4>
          <p class="team-description">Ms. Choudhury manages the digital library, curating e-resources and subscriptions that provide students and faculty with access to a wealth of online content.</p>
        </div>
      </div>

      <!-- Team Member 5 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a5..jpg" alt="Tara Joshi" class="team-image" />
          <h4 class="team-name">Ms. Tara Joshi, Technology and Systems Librarian</h4>
          <p class="team-description">Ms. Joshi manages the library’s digital infrastructure, ensuring reliable access to e-resources and providing technical support for students and staff.</p>
        </div>
      </div>

      <!-- Team Member 6 -->
      <div class="col-md-4">
        <div class="team-card">
          <img src="img1/a6.jpeg" alt="Aanya Desai" class="team-image" />
          <h4 class="team-name">Ms. Aanya Desai, User Experience Specialist</h4>
          <p class="team-description">Ms. Desai focuses on making the library accessible and user-friendly, helping new students navigate library services and find the resources they need.</p>
        </div>
      </div>
    </div>
  </div>
</section>


        <br />
        <!--connect start-->
        <section id="contact-us" class="contact-section" style="background-color: #FFE4C4; padding: 50px 0; text-align: center;">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 style="font-size: 2.5rem; font-weight: bold; color: #FF6F61;">Connect With Us</h2>
                <p style="font-size: 1.1rem; color: #3E2723; margin-top: 20px;">We’re here to help and would love to hear from you. If you have questions or feedback, feel free to get in touch through our contact email. At <strong>E-Library</strong> of <strong>Greenfield Institute of Technology</strong>, we’re committed to building a community of learners and readers.</p>
                <p style="font-size: 1.1rem; color: #3E2723; margin-top: 10px;">Thank you for choosing <strong>E-Library</strong> – we look forward to supporting you on your journey of discovery!</p>
                <p style="font-size: 1.2rem; font-weight: bold; margin-top: 30px;">
                    <a href="mailto:library@greenfield.edu" style="text-decoration: none; color: #FF6F61; border-bottom: 2px solid #FF6F61; padding-bottom: 5px; transition: 0.3s;">Email us at: <span style="color: #FF6F61;">library@greenfield.edu</span></a>
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Additional Styling for Hover Effects -->
<style>

   
  /* Container Styling */
  .team-container {
    background-color: #FFE4C4; /* Soft peach for a warm feel */
    padding: 40px;
    border-radius: 12px;
  }

  /* Section Heading */
  .team-heading {
    font-family: 'Roboto', sans-serif;
    color: #FF6F61; /* Warm Burgundy for professionalism */
    font-size: 2.5em;
    margin-bottom: 30px;
    padding-bottom: 10px;
    border-bottom: 4px solid #FF6F61; /* Consistent border color */
    text-transform: uppercase;
    letter-spacing: 1px;
  }

  /* Card Container */
  .team-card {
    background-color: #F9F5F1; /* Off-white for contrast */
    border: 2px solid #E0D6D1; /* Light beige for subtle borders */
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
    margin: 10px 0;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover effect */
  }

  .team-card:hover {
    transform: translateY(-5px); /* Lift effect */
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2); /* More pronounced shadow on hover */
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
    transform: scale(1.1); /* Slight zoom effect */
  }

  /* Name Styling */
  .team-name {
    color: #5A3E36; /* Dark brown for warmth */
    font-weight: bold;
    margin-top: 15px;
    font-size: 1.2em;
  }

  /* Description Text */
  .team-description {
    color: #4F4F4F; /* Dark gray for readability */
    text-align: justify;
    font-size: 0.9em;
    line-height: 1.6;
    margin-top: 10px;
  }
















     .background-image {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 55vh;
            background-image: url('img1/A3.png');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }

    #contact-us a:hover {
        color: #fff;
        background-color: #FF6F61;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 5px;
    }

    #contact-us h2 {
        font-family: 'Arial', sans-serif;
        font-weight: bold;
    }

    #contact-us p {
        font-family: 'Helvetica', sans-serif;
    }
</style>

</asp:Content>
