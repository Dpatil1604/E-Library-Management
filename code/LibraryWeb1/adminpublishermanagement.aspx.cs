using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWeb1
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

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

                    string query = "SELECT * FROM publisher_master;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        // Button 2: Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher with this ID already exists.');</script>");
            }
            else
            {
                addNewPublisher();
            }
        }

        // Button 3: Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                updatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist.');</script>");
            }
        }

        // Button 4: Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist.');</script>");
            }
        }

        // Button 1: Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }
        //user defined function
        void getPublisherByID()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM publisher_master WHERE publisher_id = @PublisherID", con);
                    cmd.Parameters.AddWithValue("@PublisherID", TextBox3.Text.Trim());
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        TextBox4.Text = dt.Rows[0]["publisher_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Publisher ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deletePublisher()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "DELETE FROM publisher_master WHERE publisher_id = @PublisherID";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PublisherID", TextBox3.Text.Trim());
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "UPDATE publisher_master SET publisher_name = @PublisherName WHERE publisher_id = @PublisherID";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PublisherID", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@PublisherName", TextBox4.Text.Trim());
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewPublisher()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "INSERT INTO publisher_master (publisher_id, publisher_name) VALUES (@PublisherID, @PublisherName)";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PublisherID", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@PublisherName", TextBox4.Text.Trim());
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Publisher Added Successfully');</script>");
                        clearForm();
                    }
                }
                BindGridView();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfPublisherExists()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM publisher_master WHERE publisher_id = @PublisherID", con);
                    cmd.Parameters.AddWithValue("@PublisherID", TextBox3.Text.Trim());
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count >= 1;
                }
            }
            catch (Exception ex)
            {
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
