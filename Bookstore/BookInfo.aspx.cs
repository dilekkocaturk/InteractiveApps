using System;
using System.Collections;
using System.Web;

namespace Bookstore
{
    public partial class BookInfo : System.Web.UI.Page
    {
        String book_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"]; // Retrieve user info from cookie
            ArrayList All_BookIndices = new ArrayList();
            All_BookIndices = (ArrayList)Session["Info_Book"];

            lbl_add_info.Visible = false;

            if (All_BookIndices == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (cookie != null)
            {
                book_id = Request.QueryString["id"];
                Panel_User_Info.Visible = true;
                lbl_user_name.Text = cookie["first_name"] + " " + cookie["last_name"];

                if (book_id != null && All_BookIndices != null)
                {
                    try
                    {
                        int i = System.Convert.ToInt32(book_id);

                        if (i<= All_BookIndices.Count)
                        {
                            Book chosen_book = (Book)All_BookIndices[i-1];
                            Panel_Info.Visible = false;
                            Panel_Book.Visible = true;

                            // Set the book information to the labels
                            ImageButton_book.ImageUrl = chosen_book.BookUrl;
                            lbl_title.Text = chosen_book.Title;
                            lbl_author_black.Text = chosen_book.Author;
                            lbl_genre_black.Text = chosen_book.Genre;
                            lbl_year_black.Text = chosen_book.Year.ToString();
                        }
                        else
                        {
                            Panel_Info.Visible = true;
                            Panel_Book.Visible = false;
                            hlbl_link.Visible = false;
                            Panel_User_Info.Visible = false;
                            lbl_info.Text = "Please specify the appropriate book id.";
                        }
                    }
                    catch (FormatException)
                    {
                        hlbl_link.Visible = false;
                        Panel_Book.Visible = false;
                        Panel_User_Info.Visible = false;
                        lbl_info.Text = "Please specify the appropriate book id.";
                    }
                }
                else
                {
                    hlbl_link.Visible = false;
                    Panel_Book.Visible = false;
                    Panel_User_Info.Visible = false;
                    lbl_info.Text = "Please specify the book id.";
                }
            }
            else
            {
                Panel_Info.Visible = true;
                Panel_Book.Visible = false;
                Panel_User_Info.Visible = false;
            }
        }
        protected void btn_add_cart_Click(object sender, EventArgs e)
        {
            ArrayList SelectedBookIndices = (ArrayList)Session["CartInfo"];
            lbl_add_info.Visible = true;

            if (SelectedBookIndices != null)
            {
                // Check if the book is already in the shopping cart
                if (SelectedBookIndices.Contains(book_id))
                {
                    lbl_add_info.Text = "The book is already in the shopping cart.";
                }
                else
                {
                    // Add the book to shopping cart
                    SelectedBookIndices.Add(book_id);
                    lbl_add_info.Text = "The book added to shopping cart.";
                }
            }
            else
            {
                SelectedBookIndices = new ArrayList();
                SelectedBookIndices.Add(book_id);
                Session["CartInfo"] = SelectedBookIndices;
                lbl_add_info.Text = "The book added to shopping cart.";
            }
        }
        protected void btn_go_to_cart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
        protected void btn_go_to_default_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btn_log_out_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("UserInfo");
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("Default.aspx");
        }
    }
}