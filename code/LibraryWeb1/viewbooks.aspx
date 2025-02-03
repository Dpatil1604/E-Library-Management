<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="LibraryWeb1.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <script type="text/javascript">



        //search andalll buttons
        $(document).ready(function () {
            // Fix for GridView headers
            var table = $('#<%= GridView1.ClientID %>');

                // Ensure GridView has a proper <thead> and <tbody> structure
                table.find('thead').remove(); // Remove any existing <thead>
                table.prepend($('<thead></thead>').append(table.find('tr:first'))); // Wrap the first row as <thead>

                // Initialize DataTables with Bootstrap 5 styling
                table.DataTable({
                    paging: true,          // Enable pagination
                    searching: true,       // Enable search
                    info: true,            // Enable entry info
                    lengthChange: true,    // Enable "Show entries"
                    autoWidth: false,      // Disable auto width for better alignment
                    responsive: true,      // Make table responsive
                    dom: '<"row"<"col-md-6"l><"col-md-6"f>>' + // Layout for length and search
                        '<"row"<"col-12"tr>>' +               // Layout for table
                        '<"row"<"col-md-5"i><"col-md-7 text-end"p>>',  // Align pagination to the right
                    language: {
                        lengthMenu: "Show _MENU_ entries",
                        search: "Search:",
                        info: "Showing _START_ to _END_ of _TOTAL_ entries",
                        paginate: {
                            previous: "Previous", // Replace with "Previous"
                            next: "Next"          // Replace with "Next"
                        }
                    }
                });
            });

        
        


        


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-sm-12">
            <center>
                <h3>Book Inventory List</h3>
            </center>

            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                        <div class="alert alert-success" role="alert">
                            <asp:Label runat="server" Text="Label"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <br />

            <div class="row">
                


                <div class="card">
                        <div class="card-body">
                            
                            

                          <div class="row">
    <div class="col">
        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Bold="False">
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

        <div class="col-sm-12 text-center">
            <a href="home.aspx">&laquo; Back to Home</a>
        </div>
    </div>
</div>


</asp:Content>
