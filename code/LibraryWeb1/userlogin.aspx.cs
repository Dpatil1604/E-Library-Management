using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web.UI;

namespace LibraryWeb1
{
    public partial class userlogin : System.Web.UI.Page
    {
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void MemberLoginButton_Click(object sender, EventArgs e)
        {
            string username = MemberTextBox1.Text.Trim().ToLower();

            if (username == "admin")
            {
                Response.Write("<script>alert('Admin login is restricted from user login page!');</script>");
                return;
            }

            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    con.Open();

                    string query = "SELECT * FROM elibrarydb.member_master WHERE member_id=@member_id AND password=@password";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", MemberTextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", PasswordTextBox2.Text.Trim());

                        using (MySqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    Session["username"] = dr.GetValue(8).ToString();
                                    Session["fullname"] = dr.GetValue(0).ToString();
                                    Session["role"] = "user";
                                    Session["status"] = dr.GetValue(10).ToString();
                                }
                                // Proper redirection
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
