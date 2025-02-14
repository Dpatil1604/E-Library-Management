using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryWeb1
{
    public partial class ResetPsw : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string GUIDvalue;
        DataTable dt = new DataTable();
        string Uid;  // Changed from int to string

        protected void Page_Load(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(strcon))
            {
                GUIDvalue = Request.QueryString["Uid"];
                if (GUIDvalue != null)
                {
                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM ForgotPassRequests WHERE GUID = @GUID", con);
                    cmd.Parameters.AddWithValue("@GUID", GUIDvalue);
                    con.Open();
                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    sda.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        Uid = dt.Rows[0]["Uid"].ToString();  // Convert Uid to string (email)
                    }
                    else
                    {
                        Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid!'); </script>");
                    }
                }
                else
                {
                    Response.Redirect("~/Forgotpsw.aspx");
                }
               
            }

            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    npt.Visible = true;
                    cpt.Visible = true;
                    btnReset.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid!'); </script>");
                }
            }
        }
        protected void ClearForm()
        {
            npt.Text = "";  // Clears the new password textbox
            cpt.Text = "";  // Clears the confirm password textbox
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (npt.Text != "" && cpt.Text != "" && npt.Text == cpt.Text)
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    // Update the password in member_master using email
                    MySqlCommand cmd = new MySqlCommand("UPDATE member_master SET password = @NewPassword WHERE email = @Uid", con);
                    cmd.Parameters.AddWithValue("@NewPassword", npt.Text);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Remove the used request from ForgotPassRequests
                    MySqlCommand cmd2 = new MySqlCommand("DELETE FROM ForgotPassRequests WHERE Uid = @Uid", con);
                    cmd2.Parameters.AddWithValue("@Uid", Uid);  // Use Uid, not email
                    cmd2.ExecuteNonQuery();


                    Response.Write("<script>alert('Password Successfully Changed'); </script>");
                    ClearForm();
                }
            }
            else
            {
                Response.Write("<script>alert('All fields are mandatory and passwords must match');</script>");
                ClearForm();
            }
        }
    }
}
