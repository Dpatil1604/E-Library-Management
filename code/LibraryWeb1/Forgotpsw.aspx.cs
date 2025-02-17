using System;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace LibraryWeb1
{
    public partial class Forgotpsw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string userEmail = txtEmail.Text.Trim();

            // Validate email format
            if (!IsValidEmail(userEmail))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            using (MySqlConnection con = new MySqlConnection(strcon))
            {
                try
                {
                    con.Open();

                    // Check if the email exists in the database
                    MySqlCommand cmd = new MySqlCommand("SELECT email, full_name FROM member_master WHERE email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", userEmail);
                    MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        // Generate password reset token
                        string myGUID = Guid.NewGuid().ToString();
                        string fullName = dt.Rows[0]["full_name"].ToString();
                        string email = dt.Rows[0]["email"].ToString();

                        // Insert token into ForgotPassRequests table
                        MySqlCommand cmd1 = new MySqlCommand("INSERT INTO ForgotPassRequests (GUID, Uid, RequestDateTime) VALUES(@GUID, @Uid, NOW())", con);
                        cmd1.Parameters.AddWithValue("@GUID", myGUID);
                        cmd1.Parameters.AddWithValue("@Uid", email);
                        cmd1.ExecuteNonQuery();

                        // Send email
                        if (SendResetEmail(email, fullName, myGUID))
                        {
                            Response.Write("<script>alert('Check your email to reset your password.');</script>");
                            ClearForm();
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to send email. Please try again later.');</script>");
                            ClearForm();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Email address not found.');</script>");
                        ClearForm();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Database error: " + ex.Message + "');</script>");
                    ClearForm();
                }
            }
        }

        private bool SendResetEmail(string toEmail, string username, string guid)
        {
            try
            {
                string fromEmail = "greenfieldlibrary04@gmail.com"; // Your Gmail address
                string appPassword = "zzpj edlh qyvj dkbd"; // Your App Password

                string resetLink = $"https://localhost:44317/ResetPsw.aspx?Uid={guid}";

                string emailBody = $@"
            <p>Hi {username},</p>
            <p>Click the link below to reset your password:</p>
            <p><a href='{resetLink}'>Reset Password</a></p>
            <p>If you did not request this, please ignore this email.</p>
            <br/>
            <p>Regards,</p>
            <p>Library Support</p>";

                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(fromEmail, "Library Support"),
                    Subject = "Password Reset Request",
                    Body = emailBody,
                    IsBodyHtml = true
                };

                mail.To.Add(new MailAddress(toEmail));

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential(fromEmail, appPassword),
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network
                };

                int retryCount = 0;
                while (retryCount < 3) // Retry mechanism
                {
                    try
                    {
                        smtp.Send(mail);
                        return true; // Email sent successfully
                    }
                    catch (SmtpException smtpEx)
                    {
                        retryCount++;
                        Console.WriteLine($"SMTP Error (Attempt {retryCount}): {smtpEx.Message}");
                        if (retryCount == 3)
                        {
                            Response.Write("<script>alert('Failed to send email. Please check your SMTP settings.');</script>");
                            return false;
                        }
                    }
                }

                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine("General Error: " + ex.Message);
                Response.Write("<script>alert('An error occurred while sending the email.');</script>");
                return false;
            }
        }

        protected void ClearForm()
        {
            txtEmail.Text = ""; // Clears the email input field
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}
