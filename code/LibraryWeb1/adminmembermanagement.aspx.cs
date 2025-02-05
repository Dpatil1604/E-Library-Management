using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LibraryWeb1
{
    public partial class adminmembermanagement : System.Web.UI.Page

    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMemberGridView();
            }
        }

        private void BindMemberGridView()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "SELECT member_id, full_name, contact_no, email, state, city, account_status FROM member_master;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            GridView1.DataSource = dt; // Using your specified GridView ID
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


        //go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        //Active button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           updateMemberStatusByID("active");
        }
        //pending button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }
        //Deactive button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
             updateMemberStatusByID("deactive");
        }
        //Delete button
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        //user defined function


        bool checkIfMemberExists()
        { 
            
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.member_master WHERE member_id ='" + TextBox3.Text.Trim() + "';", con);
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

        void deleteMemberByID()
        {
            if (checkIfMemberExists())
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
                                DELETE FROM member_master
                                WHERE member_id = @member_id;";

                        using (MySqlCommand cmd = new MySqlCommand(query, con))
                        {
                            // Adding parameter to prevent SQL injection
                            cmd.Parameters.AddWithValue("@member_id", TextBox3.Text.Trim());

                            // Execute the DELETE query
                            cmd.ExecuteNonQuery();

                            // Close the connection (optional, as 'using' handles this automatically)
                            con.Close();

                            // Alert on successful deletion
                            Response.Write("<script>alert('Member Deleted Successfully');</script>");

                            // Clear the form inputs
                            clearform();
                        }
                    }

                    // Refresh the GridView to reflect changes
                    BindMemberGridView();
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
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void getMemberByID()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.member_master where  member_id='" + TextBox3.Text.Trim()  + "'", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        TextBox4.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(10).ToString();
                        TextBox8.Text = dr.GetValue(1).ToString();
                        TextBox1.Text = dr.GetValue(2).ToString();
                        TextBox2.Text = dr.GetValue(3).ToString();
                        TextBox9.Text = dr.GetValue(4).ToString();
                        TextBox10.Text = dr.GetValue(5).ToString();
                        TextBox11.Text = dr.GetValue(6).ToString();
                        TextBox5.Text = dr.GetValue(7).ToString();
                    
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid Creadentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    MySqlConnection con = new MySqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("UPDATE elibrarydb.member_master SET account_status = @status WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@member_id", TextBox3.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    BindMemberGridView();
                    getMemberByID();
                    Response.Write("<script>alert('Member Status Updated');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
                

        }

        void clearform()
        {
            TextBox4.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox5.Text = "";
        }
    }

       
    }