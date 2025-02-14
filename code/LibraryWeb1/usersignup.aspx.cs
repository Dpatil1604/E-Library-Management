using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace LibraryWeb1
{
    public partial class usersignup : System.Web.UI.Page
    {
        // Connection string fetched from Web.config
        private readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Add logic if needed during page load
        }

        // Sign-up (register) button click event
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Member already exists with this Member ID. Please try another ID.');", true);
            }
            else
            {
                SignUpNewUser();
                ClearForm(); // Clear the form after successful signup
                             // Redirect to login page
                Response.Redirect("userlogin.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        // Check if the member already exists in the database
        private bool CheckMemberExists()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.member_master WHERE member_id ='" + UserIDTextBox.Text.Trim() + "';", con);
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
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                return false;
            }
        }

        // Insert a new user into the database
        private void SignUpNewUser()
        {
            string username = UserIDTextBox.Text.Trim().ToLower();

            // Prevent "admin" or similar usernames from signing up
            if (username == "admin" || username.Contains("admin"))
            {
                Response.Write("<script>alert('You cannot use \"admin\" in the username. Please choose another username.');</script>");
                return;
            }
            if (IsValidInput())
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
                            INSERT INTO member_master 
                            (full_name, dob, contact_no, email, state, city, pincode, full_address, member_id, password, account_status) 
                            VALUES 
                            (@full_name, @dob, @contact_no, @email, @state, @city, @pincode, @full_address, @member_id, @password, @account_status)";

                        using (MySqlCommand cmd = new MySqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@full_name", FullNameTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@dob", DateOfBirthTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@contact_no", ContactTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@state", StateDropDownList.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@city", CityTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@pincode", PincodeTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@full_address", AddressTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@member_id", UserIDTextBox.Text.Trim());
                            cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text.Trim()); // Hash passwords in production
                            cmd.Parameters.AddWithValue("@account_status", "pending");

                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('Sign Up Successful. Go to User Login to log in.');</script>");

                        }
                    }

                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sign Up Successful. Go to User Login to log in.');", true);
                }
                catch (Exception ex)
                {
                     Response.Write("<script>alert('" + ex.Message + "');</script>");
                    // ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }

        // Method to clear all input fields in the form
        private void ClearForm()
        {
            FullNameTextBox.Text = "";
            DateOfBirthTextBox.Text = "";
            ContactTextBox.Text = "";
            EmailTextBox.Text = "";
            CityTextBox.Text = "";
            PincodeTextBox.Text = "";
            AddressTextBox.Text = "";
            UserIDTextBox.Text = "";
            PasswordTextBox.Text = "";

            // Reset the dropdown list to the default value (assuming the first item is the default)
            StateDropDownList.SelectedIndex = 0;
        }

        // Validate user input
        private bool IsValidInput()
        {
            if (string.IsNullOrWhiteSpace(FullNameTextBox.Text))
            {
                Alert("Full Name is required");
                return false;
            }
            if (string.IsNullOrWhiteSpace(DateOfBirthTextBox.Text))
            {
                Alert("Date of Birth is required");
                return false;
            }
            if (string.IsNullOrWhiteSpace(ContactTextBox.Text))
            {
                Alert("Contact Number is required");
                return false;
            }
            if (string.IsNullOrWhiteSpace(EmailTextBox.Text))
            {
                Alert("Email is required");
                return false;
            }
            if (string.IsNullOrWhiteSpace(CityTextBox.Text))
            {
                Alert("City Name is required");
                return false;
            }

            if (string.IsNullOrWhiteSpace(UserIDTextBox.Text))
            {
                Alert("User ID is required");
                return false;
            }
            if (string.IsNullOrWhiteSpace(PasswordTextBox.Text))
            {
                Alert("Password is required");
                return false;
            }

            return true;
        }

        // Helper method to display alerts
        private void Alert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }
    }
}
