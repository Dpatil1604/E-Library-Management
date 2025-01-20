using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWeb1
{ 
    
    public partial class userlogin : System.Web.UI.Page
    { 
        //Connection string fetched from Web.config
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        { 
        }
    
    
        //user login
        protected void MemberLoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.member_master where  member_id='"+ MemberTextBox1.Text.Trim() + "' AND password='"+ PasswordTextBox2.Text.Trim() + "';", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while(dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(8).ToString() + "');</script>");
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
          //  ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sign Up Successful.');", true);
        }

        //user defined functions
    }
}