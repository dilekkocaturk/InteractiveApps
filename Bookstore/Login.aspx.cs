using System;
using System.Web;

namespace Bookstore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"]; // Retrieve user info from cookie

            // If the cookie exists, it means the user is already logged in
            if (cookie != null)
            {
                Panel_Login.Visible = false;
                Panel_Info.Visible = true;           
            }
            // If the cookie does not exist, it means the user is not logged in
            else
            {
                Panel_Login.Visible = true;
                Panel_Info.Visible = false;
            }
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            // If both first name and last name are empty, show an error message
            if (txtBox_first_name.Text == "" && txtBox_last_name.Text == "")
            {
                lbl_error.Text = "Please enter your First Name and Last Name.";
            }
            else if (txtBox_first_name.Text == "")
            {
                lbl_error.Text = "Please enter your First Name.";
            }
            else if (txtBox_last_name.Text == "")
            {
                lbl_error.Text = "Please enter your Last Name.";
            }
            // If both first name and last name are provided, create a user info cookie and redirect to the default page
            else
            {
                HttpCookie cookie = new HttpCookie("UserInfo");
                cookie["first_name"] = txtBox_first_name.Text.ToString();
                cookie["last_name"] = txtBox_last_name.Text.ToString();
                cookie.Expires = DateTime.Now.AddMonths(1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Default.aspx");
            }
        }
        protected void btn_ask_login_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("UserInfo"); // Create a new cookie
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("Login.aspx");
        }
        protected void btn_continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}