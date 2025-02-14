using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace LibraryWeb1
{
    public partial class adminlogin : System.Web.UI.Page
    {
        // Fetch connection string from Web.config
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void MemberLoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    con.Open(); // Open MySQL connection

                    // Secure query using parameters
                    string query = "SELECT username, full_name FROM elibrarydb.admin_login WHERE username = @username AND password = @password";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", MemberTextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", PasswordTextBox2.Text.Trim());

                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows) // If user exists
                            {
                                while (dr.Read())
                                {
                                    // Store login details in Session variables
                                    Session["username"] = dr["username"].ToString();
                                    Session["fullname"] = dr["full_name"].ToString();
                                    Session["role"] = "admin";
                                }

                                // Ensure session is saved before redirecting
                                Session.Timeout = 30; // Session expires after 30 minutes
                                Response.Redirect("homepage.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Invalid Credentials');</script>");
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
    }
}
