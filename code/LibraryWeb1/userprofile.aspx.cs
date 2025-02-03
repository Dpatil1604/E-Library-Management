using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWeb1
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        userbookdata(); // Load only user-specific data
                        getuserpersonaldetail(); // Load user personal details
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }
        //update button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
            {
                Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            

            }
        }

        // Function to fetch only the logged-in user's issued books

        void getuserpersonaldetail()
        {

            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Debugging: Check session username
                    //Response.Write("<script>console.log('Session Username: " + Session["username"].ToString() + "');</script>");

                    string query = "SELECT * FROM member_master WHERE member_id = @memberID";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@memberID", Session["username"].ToString());

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                            TextBox4.Text = dt.Rows[0]["dob"].ToString();

                            TextBox5.Text = dt.Rows[0]["contact_no"].ToString();
                            TextBox6.Text = dt.Rows[0]["email"].ToString();

                            DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                            TextBox8.Text = dt.Rows[0]["city"].ToString();

                            TextBox9.Text = dt.Rows[0]["pincode"].ToString();
                            TextBox7.Text = dt.Rows[0]["full_address"].ToString();

                            TextBox1.Text = dt.Rows[0]["member_id"].ToString();
                            TextBox2.Text = dt.Rows[0]["password"].ToString();


                            Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                            if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                            {
                                Label1.Attributes.Add("class", "badge badge-pill badge-success");
                            }
                            else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                            {
                                Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                            }
                            else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                            {
                                Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                            }
                            else
                            {
                                Label1.Attributes.Add("class", "badge badge-pill badge-secondary");
                            }




                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }
        void userbookdata()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Debugging: Check session username
                    Response.Write("<script>console.log('Session Username: " + Session["username"].ToString() + "');</script>");

                    string query = "SELECT * FROM book_issue WHERE member_id = @memberID";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@memberID", Session["username"].ToString());

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Clear previous data to avoid mixing results
                            GridView1.DataSource = null;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        // Function to highlight overdue books
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string dueDateString = e.Row.Cells[5].Text.Trim(); // Adjust index if needed

                    if (DateTime.TryParse(dueDateString, out DateTime dueDate))
                    {
                        if (DateTime.Today > dueDate) // If overdue
                        {
                            e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error in RowDataBound: " + ex.Message + "');</script>");
            }
        }



        void updateUserPersonalDetails()
        {
            string password = string.IsNullOrWhiteSpace(TextBox10.Text) ? TextBox2.Text.Trim() : TextBox10.Text.Trim();

            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon)) // Use MySqlConnection
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "UPDATE member_master SET full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, " +
                                   "state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, " +
                                   "account_status=@account_status WHERE member_id=@memberID";

                    using (MySqlCommand cmd = new MySqlCommand(query, con)) // Use MySqlCommand
                    {
                        cmd.Parameters.AddWithValue("@full_name", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@dob", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact_no", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@city", TextBox8.Text.Trim());
                        cmd.Parameters.AddWithValue("@pincode", TextBox9.Text.Trim());
                        cmd.Parameters.AddWithValue("@full_address", TextBox7.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@account_status", "pending");
                        cmd.Parameters.AddWithValue("@memberID", Session["username"].ToString().Trim());

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            Response.Write("<script>alert('Your details have been updated successfully!');</script>");
                            getuserpersonaldetail(); // Reload updated details
                            userbookdata(); // Refresh issued books list
                        }
                        else
                        {
                            Response.Write("<script>alert('Update failed! Please try again.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }





    }

}

