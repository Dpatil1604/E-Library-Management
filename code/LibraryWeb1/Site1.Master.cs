using System;
using System.Web;
using System.Web.UI;

namespace LibraryWeb1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Debug: Check what role is stored in session
                Response.Write("<script>console.log('Role: " + Session["role"] + "');</script>");

                if (Session["role"] == null || string.IsNullOrEmpty(Session["role"].ToString()))
                {
                    // User is not logged in
                    LinkButton2.Visible = true;  // user login link button
                    LinkButton3.Visible = true;  // sign-up link button
                    LinkButton4.Visible = false; // log out link button
                    LinkButton5.Visible = false; // hello user link button
                    LinkButton6.Visible = true;  // admin login link button

                    // Hide admin management buttons
                    LinkButton7.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton11.Visible = false;
                }
                else if (Session["role"].ToString() == "user")
                {
                    // Regular user logged in
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton4.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton5.Text = "Hello " + Session["username"].ToString();
                    LinkButton6.Visible = true;

                    // Hide admin management buttons
                    LinkButton7.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton11.Visible = false;
                }
                else if (Session["role"].ToString() == "admin")
                {
                    // Admin logged in
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton4.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton5.Text = "Hello Admin";

                    // Show admin management buttons
                    LinkButton6.Visible = false; // Hide admin login button after login
                    LinkButton7.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                    LinkButton11.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookIssuing.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            // Logout functionality
            Session["username"] = null;
            Session["fullname"] = null;
            Session["role"] = null;

            // Optionally, abandon the session completely
            Session.Abandon();

            // Reset UI elements visibility
            LinkButton2.Visible = true;   // user login link button
            LinkButton3.Visible = true;   // sign-up link button
            LinkButton4.Visible = false;  // log out link button
            LinkButton5.Visible = false;  // hello user link button
            LinkButton6.Visible = true;   // admin login link button

            // Hide admin management buttons
            LinkButton7.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;
            LinkButton10.Visible = false;
            LinkButton11.Visible = false;

            // Redirect to homepage
            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}
