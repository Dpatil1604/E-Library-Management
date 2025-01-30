using System;
using System.Configuration;
using System.Data;
using System.IO;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace LibraryWeb1
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

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
        }
        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
        }

        //user defined function
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
                string genres = "";
                foreach (ListItem item in ListBox1.Items)
                {
                    if (item.Selected)
                    {
                        genres += item.Value + ",";
                    }
                }
                genres = genres.TrimEnd(',');

                string filepath = "~/book_inventory/default.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }

                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    con.Open();
                    string query = "INSERT INTO book_master (book_id, book_name, language, publisher_name, author_name, publisher_date, genre, edition, book_cost, pages, actual_stock, current_stock, issued_books, book_description, book_img_link) " +
                                   "VALUES (@book_id, @book_name, @language, @publisher_name, @author_name, @publisher_date, @genre, @edition, @book_cost, @pages, @actual_stock, @current_stock, @issued_books, @book_description, @book_img_link)";

                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_date", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@pages", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_stock", TextBox2.Text.Trim()); // Initial stock = actual stock
                    cmd.Parameters.AddWithValue("@issued_books", "0"); // Default to 0
                    cmd.Parameters.AddWithValue("@book_description", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Added Successfully');</script>");
                    BindGridView(); // Refresh the book inventory list
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}