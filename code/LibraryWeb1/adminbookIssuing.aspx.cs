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
    public partial class adminbookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "SELECT * FROM book_issue;";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            GridView1.DataSource = dt; // Using your specified GridView ID
                            GridView1.DataBind();

                            // Check for overdue books and send notifications
                            CheckForOverdueBooks(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void CheckForOverdueBooks(DataTable dt)
        {
            DateTime today = DateTime.Today;

            foreach (DataRow row in dt.Rows)
            {
                DateTime dueDate = Convert.ToDateTime(row["due_date"]);
                string memberId = row["member_id"].ToString();

                // If the due date is passed and the notification hasn't been sent
                if (today > dueDate && Convert.ToBoolean(row["notification_sent"]) == false)
                {
                    SendOverdueNotification(memberId, dueDate);

                    // Set user status to 'deactive' after overdue
                    SetUserStatusToDeactive(memberId);

                    // Update the notification_sent flag to true
                    UpdateNotificationStatus(memberId);
                }
            }
        }


        private void UpdateNotificationStatus(string memberId)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("UPDATE book_issue SET notification_sent = 1 WHERE member_id = @memberId", con);
                    cmd.Parameters.AddWithValue("@memberId", memberId);

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Notification status updated');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating notification status: " + ex.Message + "');</script>");
            }
        }


        private void SetUserStatusToDeactive(string memberId)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                        //Response.Write("<script>alert('Connection opened successfully');</script>");
                    }

                    string query = "UPDATE member_master SET account_status = 'deactive' WHERE member_id = @memberId";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@memberId", memberId);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('User status set to Deactive');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('No rows updated. Please verify the Member ID.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }






        private void SendOverdueNotification(string memberId, DateTime dueDate)
        {
            try
            {
                // Get member email from the database
                string memberEmail = GetMemberEmail(memberId);

                if (!string.IsNullOrEmpty(memberEmail))
                {
                    // Create the email message
                    var mailMessage = new System.Net.Mail.MailMessage();
                    mailMessage.From = new System.Net.Mail.MailAddress("greenfieldlibrary04@gmail.com");
                    mailMessage.To.Add(memberEmail);
                    mailMessage.Subject = "Overdue Book Notification";
                    mailMessage.Body = $"Dear Member, your book is overdue. It was due on {dueDate.ToShortDateString()}.";

                    // Set up the SMTP client
                    var smtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new System.Net.NetworkCredential("greenfieldlibrary04@gmail.com", "zzpj edlh qyvj dkbd"),
                        EnableSsl = true,
                    };

                    // Send the email
                    smtpClient.Send(mailMessage);


                    // Log success
                    Response.Write("<script>alert('Overdue Notification Sent');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error in sending notification: " + ex.Message + "');</script>");
            }
        }

        private string GetMemberEmail(string memberId)
        {
            string email = string.Empty;

            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    MySqlCommand cmd = new MySqlCommand("SELECT email FROM elibrarydb.member_master WHERE member_id = @memberId", con);
                    cmd.Parameters.AddWithValue("@memberId", memberId);

                    email = cmd.ExecuteScalar()?.ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error fetching email: " + ex.Message + "');</script>");
            }

            return email;
        }








        //go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getnames();

        }
        //issue button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                // Get the user status from the database
                string userStatus = getUserStatus(TextBox4.Text.Trim());

                // Log the userStatus for debugging purposes
                Response.Write($"<script>alert('User Status: {userStatus}');</script>");

                // For comparison, convert to lower case to avoid case sensitivity issues
                if (userStatus.ToLower() == "active")
                {
                    if (checkIfIssueEntryExist())
                    {
                        Response.Write("<script>alert('This Member Already has this book.');</script>");
                    }
                    else
                    {
                        issueBook();
                    }
                }
                else
                {
                    // Provide more detailed feedback based on the user status
                    Response.Write($"<script>alert('This Member is {userStatus}. Book cannot be issued.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }




        //delete button
        protected void Button3_Click(object sender, EventArgs e)
        {

            if (checkIfBookExist() && checkIfMemberExist())
            {
                // Check if the book has already been issued to the same member
                if (checkIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry Does not Exists');</script>");


                }
            }
            else
            {
                // If the book or member does not exist
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }

        }
        //user defined function



        // This method is used to get the status of a member
        private string getUserStatus(string memberId)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Query to retrieve the account status from the member_master table
                    MySqlCommand cmd = new MySqlCommand("SELECT account_status FROM elibrarydb.member_master WHERE member_id=@memberId", con);
                    cmd.Parameters.AddWithValue("@memberId", memberId);

                    object status = cmd.ExecuteScalar(); // Execute the query to get the status

                    // Check if a valid status is returned
                    if (status != null && !string.IsNullOrWhiteSpace(status.ToString()))
                    {
                        return status.ToString().Trim(); // Return the status (active, pending, etc.) without spaces
                    }
                    else
                    {
                        return "Unknown"; // If no status is found or status is empty, return "Unknown"
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error message (optionally you can use a logging framework here)
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return "Error"; // If an exception occurs, return "Error"
            }
        }











        void returnBook()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Delete issued book entry
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM book_issue WHERE book_id = @bookId AND member_id = @memberId", con);
                    cmd.Parameters.AddWithValue("@bookId", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@memberId", TextBox4.Text.Trim());

                    int result = cmd.ExecuteNonQuery(); // Execute delete query

                    if (result > 0)  // If deletion is successful
                    {
                        // Update current_stock in book_master
                        cmd = new MySqlCommand("UPDATE book_master SET current_stock = current_stock+1 WHERE book_id = @bookId", con);
                        cmd.Parameters.AddWithValue("@bookId", TextBox3.Text.Trim());
                        cmd.ExecuteNonQuery(); // Execute stock update

                        Response.Write("<script>alert('Book Returned Successfully');</script>");
                        clearForm();
                        // Refresh GridView after successful deletion
                        BindGridView();
                    }
                    else
                    {
                        Response.Write("<script>alert('This Entry Does Not Exist');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }



        }

        void issueBook()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // First query to insert the book issue details
                    string query = @"
                INSERT INTO book_issue
                (member_id, member_name, book_id, book_name, issue_date, due_date)  
                VALUES
                (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@member_id", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_name", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }

                    // Corrected the issue with declaring query twice. Now using a new variable for the update query.
                    string updateQuery = "UPDATE elibrarydb.book_master SET current_stock = current_stock - 1 WHERE book_id = @book_id";

                    using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                        updateCmd.ExecuteNonQuery();
                    }

                    con.Close();
                    Response.Write("<script>alert('Book Issued Successfully');</script>");


                    clearForm();
                }

                BindGridView();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExist()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.book_master WHERE book_id=@bookId AND current_stock > 0", con);
                cmd.Parameters.AddWithValue("@bookId", TextBox3.Text.Trim());  // Use parameterized query
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)  // Check if the query returned any rows
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
                // Optionally log or display exception message for debugging
                return false;
            }
        }


        bool checkIfMemberExist()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }


                MySqlCommand cmd = new MySqlCommand(" SELECT full_name FROM elibrarydb.member_master WHERE member_id = @memberId", con);
                cmd.Parameters.AddWithValue("@memberId", TextBox4.Text.Trim());  // Use parameterized query
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)  // Check if the query returned any rows
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
                // Optionally log or display exception message for debugging
                return false;
            }
        }



        bool checkIfIssueEntryExist()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                // Check if there is an existing entry for the same member and book that is not yet returned (i.e., active issue)
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.book_issue WHERE member_id = @memberId AND book_id = @bookId", con);
                cmd.Parameters.AddWithValue("@memberId", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@bookId", TextBox3.Text.Trim());  // Use parameterized query

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)  // If there's an active issue entry (book is not returned)
                    {
                        return true;  // Issue entry already exists
                    }
                    else
                    {
                        return false;  // No existing issue entry
                    }
                }
            }
            catch (Exception ex)
            {
                // Optionally log or display exception message for debugging
                return false;
            }
        }


        void getnames()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                MySqlCommand cmd = new MySqlCommand("SELECT * FROM elibrarydb.book_master WHERE book_id=@bookId", con);
                cmd.Parameters.AddWithValue("@bookId", TextBox3.Text.Trim());  // Use parameterized query
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Book ID');</script>");
                    }
                }

                cmd = new MySqlCommand("SELECT full_name FROM elibrarydb.member_master WHERE member_id=@memberId", con);
                cmd.Parameters.AddWithValue("@memberId", TextBox4.Text.Trim());  // Use parameterized query
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        TextBox1.Text = dt.Rows[0]["full_name"].ToString(); // Corrected the field name to "full_name"
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong User ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                // Optionally log or display exception message for debugging
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


        void clearForm()
        {
            // Clearing the TextBox values
            TextBox1.Text = string.Empty;  // Member Name
            TextBox2.Text = string.Empty;  // Book Name
            TextBox3.Text = string.Empty;  // Book ID
            TextBox4.Text = string.Empty;  // Member ID
            TextBox5.Text = string.Empty;  // Issue Date
            TextBox6.Text = string.Empty;  // Due Date


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string dueDateString = e.Row.Cells[5].Text; // Adjust based on your column index
                    DateTime dueDate;
                    if (DateTime.TryParse(dueDateString, out dueDate))
                    {
                        DateTime today = DateTime.Today;

                        if (today > dueDate)
                        {
                            // Highlight overdue books
                            e.Row.BackColor = System.Drawing.Color.PaleVioletRed; // Overdue color
                            e.Row.Cells[5].Text += " (Overdue)"; // Append "(Overdue)" text to the due date column
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
