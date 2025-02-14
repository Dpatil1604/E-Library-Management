using System;
using System.Configuration;
using System.Data;
using System.IO;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Linq;

namespace LibraryWeb1
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_book;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                fillAuthorPublisherValues();



            }
        }


        // Method to fetch and bind data to GridView
        private void BindGridView()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "SELECT * FROM book_master;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            GridView1.DataSource = dt; // Bind the data to GridView
                            GridView1.DataBind();     // Display the data
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, Try Another Book ID');</script>");
            }
            else
            {
                addNewBook();
            }
        }
        //delete
        protected void Button2_Click(object sender, EventArgs e)
        {
            DeleteBookByID();
        }
        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateBookByID();
        }


        //go button
        protected void Button4_Click(object sender, EventArgs e)
        {
            gebookbyID();
        }

        //user defined function



        void DeleteBookByID()
        {
            if (checkIfBookExists())
            {

                try
                {
                    // Establishing a connection using 'using' for proper resource management
                    using (MySqlConnection con = new MySqlConnection(strcon))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open(); // Open the connection if it's closed
                        }

                        string query = @"
                                DELETE FROM book_master
                                WHERE book_id = @book_id;";

                        using (MySqlCommand cmd = new MySqlCommand(query, con))
                        {
                            // Adding parameter to prevent SQL injection
                            cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());

                            // Execute the DELETE query
                            cmd.ExecuteNonQuery();

                            // Close the connection (optional, as 'using' handles this automatically)
                            con.Close();

                            // Alert on successful deletion
                            Response.Write("<script>alert('Book Deleted Successfully');</script>");

                            // Clear the form inputs
                            clearForm();


                        }
                    }

                    // Refresh the GridView to reflect changes
                    BindGridView();
                }
                catch (Exception ex)
                {
                    // Catch any errors and display an alert with the error message
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }


            }
            else
            {
                // Alert if Member ID is blank
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }

        void UpdateBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox2.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox6.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_book)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_book;
                        }
                        TextBox6.Text = "" + current_stock;
                    }
                    // Gather genres
                    string genres = string.Join(",", ListBox1.Items.Cast<ListItem>()
                                                   .Where(item => item.Selected)
                                                   .Select(item => item.Text));

                    if (string.IsNullOrEmpty(genres))
                    {
                        Response.Write("<script>alert('Please select at least one genre.');</script>");
                        return;
                    }

                    // File Upload Validation
                    string filepath = "~/book_inventory/book.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (!string.IsNullOrEmpty(filename))
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }
                    else
                    {
                        filepath = global_filepath; // Use global file path if no new file is uploaded
                    }

                    using (MySqlConnection con = new MySqlConnection(strcon))
                    {
                        if (con.State == System.Data.ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        // SQL Query for updating the book record
                        string query = @"UPDATE book_master 
                                SET book_name = @book_name, 
                                    genre = @genre, 
                                    author_name = @author_name, 
                                    publisher_name = @publisher_name, 
                                    publish_date = @publish_date, 
                                    language = @language, 
                                    edition = @edition, 
                                    book_cost = @book_cost, 
                                    no_of_pages = @no_of_pages, 
                                    book_description = @book_description, 
                                    actual_stock = @actual_stock, 
                                    current_stock = @current_stock, 
                                    book_img_link = @book_img_link 
                                WHERE book_id = @book_id";

                        MySqlCommand cmd = new MySqlCommand(query, con);

                        // Adding parameters to the query
                        cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
                        cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem?.Text ?? "");
                        cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem?.Text ?? "");


                        // Validate and format publish date
                        if (DateTime.TryParse(TextBox1.Text.Trim(), out DateTime publishDate))
                        {
                            cmd.Parameters.AddWithValue("@publish_date", publishDate.ToString("yyyy-MM-dd"));
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Publish Date');</script>");
                            return;
                        }

                        cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                        cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

                        // Execute the query
                        cmd.ExecuteNonQuery();
                        con.Close();

                        // Refresh the grid view and notify the user
                        BindGridView();
                        Response.Write("<script>alert('Book Updated Successfully');</script>");
                        clearForm();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions and display the error message
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }


        void gebookbyID()
        {

            try
            {

                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT * FROM book_master where book_id='"+TextBox3.Text.Trim() +"';";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);


                            if (dt.Rows.Count >= 1)
                            {

                                TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                                TextBox1.Text = dt.Rows[0]["publish_date"].ToString();
                                TextBox9.Text = dt.Rows[0]["edition"].ToString();
                                TextBox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                                TextBox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                                TextBox2.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                                TextBox6.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                                TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                                TextBox5.Text = dt.Rows[0]["book_description"].ToString();



                                DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                                DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                                DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();



                                ListBox1.ClearSelection();
                                string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                                for (int i = 0; i < genre.Length; i++)
                                {
                                    for(int j = 0; j < ListBox1.Items.Count; j++)
                                    {

                                        if (ListBox1.Items[j].ToString() == genre[i])
                                        {
                                            ListBox1.Items[j].Selected = true;
                                        }
                                       
                                    }
                                }

                                global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                                global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                                global_issued_book = global_actual_stock - global_current_stock;
                                global_filepath = dt.Rows[0]["book_img_link"].ToString();



                            }
                            else
                            { 
                            Response.Write("<script>alert('Invalid Book ID');</script>");
                            }


                        }
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void fillAuthorPublisherValues()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT author_name FROM author_master;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            DropDownList3.DataSource = dt;
                            DropDownList3.DataValueField = "author_name";
                            DropDownList3.DataBind();

                            // Add a default "Select" item at the top
                            DropDownList3.Items.Insert(0, new ListItem("Select Author", ""));
                        }
                    }
                    query = "SELECT publisher_name FROM publisher_master;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            DropDownList2.DataSource = dt;
                            DropDownList2.DataValueField = "publisher_name";
                            DropDownList2.DataBind();


                            // Ensure "Select Publisher" remains at the top
                            DropDownList2.Items.Insert(0, new ListItem("Select Publisher", ""));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

       

        bool checkIfBookExists()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    con.Open();
                    string query = "SELECT * FROM book_master WHERE book_id = @book_id OR book_name = @book_name";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {
                // Fetch selected genres
                string genres = string.Join(",", ListBox1.Items.Cast<ListItem>()
                                                  .Where(item => item.Selected)
                                                  .Select(item => item.Text));

                if (string.IsNullOrEmpty(genres))
                {
                    Response.Write("<script>alert('Please select at least one genre.');</script>");
                    return;
                }

                // File Upload Validation
                string filepath = "~/book_inventory/book.png";
                if (FileUpload1.HasFile)
                {
                    string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
                    if (fileExtension != ".jpg" && fileExtension != ".png" && fileExtension != ".jpeg")
                    {
                        Response.Write("<script>alert('Only JPG, JPEG, and PNG files are allowed.');</script>");
                        return;
                    }

                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }
                else
                {
                    Response.Write("<script>alert('Please select a file to upload.');</script>");
                    return;
                }


                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = @"INSERT INTO book_master(book_id, book_name, genre, publisher_name, author_name, publish_date, language, edition, book_cost, no_of_pages, actual_stock, current_stock, book_description, book_img_link) 
                    VALUES (@book_id, @book_name, @genre, @publisher_name, @author_name, @publish_date, @language, @edition, @book_cost, @no_of_pages, @actual_stock, @current_stock, @book_description, @book_img_link)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genres);
                        cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);

                        // Validate and format publish date
                        DateTime publishDate;
                        if (DateTime.TryParse(TextBox1.Text.Trim(), out publishDate))
                        {
                            cmd.Parameters.AddWithValue("@publish_date", publishDate.ToString("yyyy-MM-dd"));
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Publish Date');</script>");
                            return;
                        }

                        cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@current_stock", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);

                        // Debugging output
                        //string debugQuery = $"INSERT INTO book_master(book_id, book_name, genre, publisher_name, author_name, publish_date, language, edition, book_cost, no_of_pages, actual_stock, current_stock, book_description, book_img_link) VALUES ('{TextBox3.Text.Trim()}', '{TextBox4.Text.Trim()}', '{genres}', '{DropDownList2.SelectedItem.Value}', '{DropDownList3.SelectedItem.Value}', '{publishDate.ToString("yyyy-MM-dd")}', '{DropDownList1.SelectedItem.Value}', '{TextBox9.Text.Trim()}', '{TextBox10.Text.Trim()}', '{TextBox11.Text.Trim()}', '{TextBox2.Text.Trim()}', '{TextBox2.Text.Trim()}', '{TextBox5.Text.Trim()}', '{filepath}');";
                       // Response.Write("<script>alert('" + debugQuery.Replace("'", "\\'") + "');</script>");


                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Book Added Successfully');</script>");
                        clearForm();
                    }
                }

                BindGridView();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.ToString() + "');</script>");
            }
        }

        protected void clearForm()
        {
            // Clear TextBoxes
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox1.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox5.Text = "";
            TextBox2.Text = "";
            TextBox6.Text = "";

            // Reset DropDownLists
            DropDownList3.SelectedIndex = 0; // Assuming index 0 is the default
            DropDownList2.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;

            // Reset ListBox1 for genre selection
            ListBox1.ClearSelection(); // This will clear any selected items
            string genres = string.Empty; // Assuming genres is reset to empty

            // Reset file path (if any file upload is used)
            string filepath = FileUpload1?.PostedFile?.FileName ?? string.Empty; ;
        }

    }
}   





           

                    
        
    
