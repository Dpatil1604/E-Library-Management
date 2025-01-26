using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
//using MySqlConnector;

namespace LibraryWeb1
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        //private readonly
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
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

                    string query = "SELECT * FROM author_master;";
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
        // add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already Exist. You cannot add another Author with the same Author ID');</script>");
            }
            else
            {
                addNewAuthor();
            }


        }
        //Update Button click
        protected void Button3_Click(object sender, EventArgs e)
        {

            if (checkIfAuthorExists())
            {
                updateAuthor();
               
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }
        //Delete Button Click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();

            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }
        //Go Button Click
        protected void Button1_Click(object sender, EventArgs e)
        {

            getAuthorByID();
        }

        //user defined function

        void getAuthorByID()
        {
            
                try
                {
                    using (MySqlConnection con = new MySqlConnection(strcon))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.author_master WHERE author_id ='" + TextBox3.Text.Trim() + "';", con);
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count >= 1)
                        {
                        TextBox4.Text = dt.Rows[0][1].ToString();
                        }
                        else
                        {
                        Response.Write("<script>alert('Invalid Author ID');</script>");
                    }
                    }

                }
                catch (Exception ex)
                {
                    // ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                    
                }
            }

        
        void deleteAuthor()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = @"
                                     DELETE FROM author_master
                                     WHERE author_id = @AuthorID;";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {


                        cmd.Parameters.AddWithValue("@AuthorID", TextBox3.Text.Trim());

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Author Deleted Succesfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sign Up Successful. Go to User Login to log in.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void updateAuthor()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = @"
                                    UPDATE author_master
                                    SET author_name = @author_name
                                    WHERE author_id = @AuthorID;";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {

                     
                        cmd.Parameters.AddWithValue("@AuthorID", TextBox3.Text.Trim()); // Assuming this is where the ID is entered
                        cmd.Parameters.AddWithValue("@author_name", TextBox4.Text.Trim());

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Author Updated Succesfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sign Up Successful. Go to User Login to log in.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void addNewAuthor()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = @"
                            INSERT INTO author_master
                            (author_id,author_name)  VALUES 
                            (@author_id,@author_name)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@author_id", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@author_name", TextBox4.Text.Trim());

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Author added Succesfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();



                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sign Up Successful. Go to User Login to log in.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfAuthorExists()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.author_master WHERE author_id ='" + TextBox3.Text.Trim() + "';", con);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                
            }
            catch (Exception ex)
            {
                // ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearForm()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}