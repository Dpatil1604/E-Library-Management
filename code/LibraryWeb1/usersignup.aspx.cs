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
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

      

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //sign up( register) button click event
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Response.Write("<script>alert('Testing');</script>");
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand(" INSERT INTO member_master( full_name ,dob ,contact_no ,email ,state ,city,pincode ,full_address ,member_id ,password ,account_status) " +
                    "values(@full_name ,@dob ,@contact_no ,@email ,@state ,@city,@pincode ,@full_address ,@member_id ,@password ,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", FullNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DateOfBirthTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ContactTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@state", StateDropDownList.SelectedItem.Value());
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", PincodeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", AddressTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id ", UserIDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password ", PasswordTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

            }
            catch(Exception ex)
            {

            }
        }
    }
}