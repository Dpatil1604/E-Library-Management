<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="LibraryWeb1.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <style>


        .home-link {
            color: #40C4FF;
            text-decoration: none;
            font-weight: bold;
            text-align: right;
            margin-top: 5px;
            margin-right: 15px;
        }


        
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    .container-fluid {
        padding: 0px;
    }
    .card {
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        margin-bottom: 30px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    }
    .card-body {
        padding: 20px;
    }
    .btn-lg {
        font-size: 16px;
        padding: 12px;
    }
    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }
    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }
    .btn-warning {
        background-color: #ffc107;
        border-color: #ffc107;
    }
    .btn-lg:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .form-group {
        margin-bottom: 1.5rem;
    }
    .form-control {
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
    }
    
    .home-link:hover {
        text-decoration: underline;
    }
    .img-fluid {
        max-width: 100%;
        height: auto;
    }
    .imgview-container {
        text-align: center;
        margin-bottom: 15px;
    }
    .imgview-container img {
        width: 100px;
        border-radius: 5px;
    }

    .table th {
        background-color: #007bff;
        color: #fff;
        //text-align: center;
    }
    
    .table-striped tbody tr:nth-child(odd) {
        background-color: #f2f2f2;
    }
    .table-bordered {
        border: 1px solid #ddd;
    }

    .card {
    border-radius: 0; /* Removes rounded corners */
}

</style>















     <script type="text/javascript">
         $(document).ready(function () {
             var table = $('#<%= GridView1.ClientID %>');

           // Ensure GridView has a proper <thead> and <tbody> structure
           table.find('thead').remove();
           table.prepend($('<thead></thead>').append(table.find('tr:first')));

           // Initialize DataTables with custom layout
           table.DataTable({
               paging: true,
               searching: true,
               info: true,
               lengthChange: true,
               autoWidth: false,
               responsive: true,
               dom: '<"row mb-4"<"col-md-6"l><"col-md-6 text-end"f>>' +  // Move Search to rightmost
                   '<"row"<"col-12"tr>>' +
                   '<"row mt-4"<"col-md-6"i><"col-md-6 text-end"p>>',  // Move pagination to bottom right
               language: {
                   lengthMenu: "Show _MENU_ entries",
                   search: "Search:",
                   info: "Showing _START_ to _END_ of _TOTAL_ entries",
                   paginate: {
                       previous: "Previous",
                       next: "Next"
                   }
               }
           });

       });


    

          //file upload
          function readURL(input) {
              if (input.files && input.files[0]) {
                  var reader = new FileReader();


                  reader.onload = function (e) {
                      $('#imgview').attr('src', e.target.result);
                  };

                  reader.readAsDataURL(input.files[0]);

              }
          }





      </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-md-5 ">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4 class="text-primary font-weight-bold">Book Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" width="100px" src="book_inventory/book.png" />
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
                                <asp:FileUpload  onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control " ID="TextBox3" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button ID="Button4" runat="server" class="btn  btn-primary" Text="Go" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                        <asp:ListItem Text="Marathi" Value="Marathi"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                        <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>

                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Publisher1" Value="Publisher1"></asp:ListItem>
                                        <asp:ListItem Text="Publisher2" Value="Publisher2"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                                        <asp:ListItem Text="a2" Value="a2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <label>Publisher Date</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Publisher Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox  class="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Select Genre" Value="" />
                                        <asp:ListItem Text="Fiction" Value="Fiction" />
                                        <asp:ListItem Text="Non-Fiction" Value="NonFiction" />
                                        <asp:ListItem Text="Science Fiction" Value="SciFi" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Mystery" Value="Mystery" />
                                        <asp:ListItem Text="Biography" Value="Biography" />
                                        <asp:ListItem Text="Self-Help" Value="SelfHelp" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Historical" Value="Historical" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Young Adult" Value="YoungAdult" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Graphic Novel" Value="GraphicNovel" />
                                        <asp:ListItem Text="Cookbook" Value="Cookbook" />
                                        <asp:ListItem Text="Art and Photography" Value="ArtPhotography" />
                                        <asp:ListItem Text="Philosophy" Value="Philosophy" />
                                        <asp:ListItem Text="Health and Wellness" Value="HealthWellness" />
                                        <asp:ListItem Text="Children's Books" Value="ChildrenBooks" />
                                        <asp:ListItem Text="Spirituality" Value="Spirituality" />
                                       
                                        <asp:ListItem Text="Textbooks" Value="Textbooks" />
                                        <asp:ListItem Text="Research Papers" Value="ResearchPapers" />
                                        <asp:ListItem Text="Science and Technology" Value="ScienceTech" />
                                        <asp:ListItem Text="Engineering" Value="Engineering" />
                                        <asp:ListItem Text="Medical Studies" Value="MedicalStudies" />
                                        <asp:ListItem Text="Law" Value="Law" />
                                        <asp:ListItem Text="Economics" Value="Economics" />
                                        <asp:ListItem Text="Business Studies" Value="BusinessStudies" />
                                        <asp:ListItem Text="Mathematics" Value="Mathematics" />
                                        <asp:ListItem Text="Computer Science" Value="ComputerScience" />
                                        <asp:ListItem Text="Language and Literature" Value="LanguageLiterature" />
                                        <asp:ListItem Text="Exam Preparation" Value="ExamPrep" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">


                                <div class="col-md-4">
                                    <label>Edition</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Edition"  ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Book Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Book Cost(per unit)" TextMode="Number" ></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Pages" TextMode="Number" ></asp:TextBox>
                                    </div>
                                </div>


                            </div>


                            <div class="row">


                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Actual Stock" TextMode="Number" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True" >Book Cost(per unit)</asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Issued Books</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="True" >Pages</asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-12 ">
                                    <label>Book Description</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Book Description"  TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>

                                </div>
                            </div>



                            <div class="row">
                                <div class="col-4">
                                   <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click"></asp:Button>

                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete " OnClick="Button2_Click"></asp:Button>
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update " OnClick="Button3_Click" ></asp:Button>
                                </div>


                            </div>
                        </div>
                    <a href="homepage.aspx" class="home-link"> Back to Home</a><br />
                    
                    </div>
                    
                </div>

                <div class="col-md-7">

                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4 class="text-primary font-weight-bold">Book Inventory List </h4>
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
        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"  Width="100%" AutoGenerateColumns="False" Font-Bold="False">
            <Columns>
                <asp:BoundField DataField="book_id" HeaderText="ID"   >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <%-- You can add more columns here if needed later --%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="container-fluid">
                            <div class="row">
                                  <div class="col-lg-10">
                                      <div class="row">
                                          <div class="col-12">
                                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-12">


                                              Author - <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>' Font-Bold="True"></asp:Label>


                                              &nbsp;| Genre -
                                              <asp:Label ID="Label3" runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>


                                              &nbsp;| Language -
                                              <asp:Label ID="Label4" runat="server" Text='<%# Eval("language") %>' Font-Bold="True"></asp:Label>


                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-12">

                                              Publisher -
                                              <asp:Label ID="Label5" runat="server" Text='<%# Eval("publisher_name") %>' ></asp:Label>

                                              &nbsp;| Publish Date -<asp:Label ID="Label6" runat="server" Text='<%# Eval("publish_date") %>' Font-Bold="True"></asp:Label>

                                               &nbsp;| Pages - <asp:Label ID="Label7" runat="server" Text='<%# Eval("no_of_pages") %>' Font-Bold="True"></asp:Label>

                                              &nbsp;| Edition - <asp:Label ID="Label8" runat="server" Text='<%# Eval("edition") %>' Font-Bold="True"></asp:Label>

                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-12">

                                              Cost - <asp:Label ID="Label9" runat="server" Text='<%# Eval("book_cost") %>'  Font-Bold="True"></asp:Label>

                                              &nbsp;| Actual Stock - <asp:Label ID="Label10" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>

                                              &nbsp;| Available - <asp:Label ID="Label11" runat="server"  Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>

                                          </div>
                                      </div>


                                      <div class="row">
                                          <div class="col-12">

                                              Description - <asp:Label ID="Label12" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>

                                          </div>
                                      </div>

                                  </div>
                               
                                <div class="col-lg-2">
                                     <asp:Image CssClass="img-fluid " ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                 </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>

                        </div>
                    </div>

                </div>

            </div>
        </div>
</asp:Content>
