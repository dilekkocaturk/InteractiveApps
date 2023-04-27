using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Bookstore
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList All_BookIndices = new ArrayList();           
            HttpCookie cookie = Request.Cookies["UserInfo"]; // Retrieve user info from cookie

            if (cookie!=null)
            {
                Panel_Info.Visible = false; 
                Panel_User_Info.Visible = true;
                Panel_Book.Visible = true;
                lbl_user_name.Text = cookie["first_name"] + " " + cookie["last_name"];

                // Create book objects with book information
                Book Book_1 = new Book(1, "To Kill a Mockingbird", "Harper Lee", "Southern Gothic",1960, "Images/To_Kill_a_Mockingbird.jpg");
                Book Book_2 = new Book(2, "1984", "George Orwell", "Dystopian", 1949, "Images/1984.jpg");
                Book Book_3 = new Book(3, "Harry Potter and the Philosopher’s Stone", "J.K. Rowling", "Fantasy", 1997, "Images/Harry_Potter_and_the_Philosophers_Stone.jpg");
                Book Book_4 = new Book(4, "The Lord of the Rings", "J.R.R. Tolkien", "High Fantasy", 1954, "Images/The_Lord_of_the_Rings.jpg");
                Book Book_5 = new Book(5, "The Great Gatsby", "F. Scott Fitzgerald", "Tragedy", 1925, "Images/The_Great_Gatsby.jpg");

                Book Book_6 = new Book(6, "Pride and Prejudice", "Jane Austen", "Classic Regency Novel", 1813, "Images/Pride_and_Prejudice.jpg");
                Book Book_7 = new Book(7, "The Diary Of A Young Girl", "Anne Frank", "Autobiography", 1947, "Images/The_Diary_Of_A_Young_Girl.jpg");
                Book Book_8 = new Book(8, "The Book Thief", "Markus Zusak", "Novel-Historical Fiction", 2005, "Images/The_Book_Thief.jpg");
                Book Book_9 = new Book(9, "The Hobbit", "J.R.R. Tolkien", "High Fantasy", 1937, "Images/The_Hobbit.jpg");
                Book Book_10 = new Book(10, "Little Women", "Louisa May Alcott", "Coming of Age", 1868, "Images/Little_Women.jpg");

                Book Book_11 = new Book(11, "Fahrenheit 451", "Ray Bradbury", "Dystopian", 1953, "Images/Fahrenheit_451.jpg");
                Book Book_12 = new Book(12, "Jane Eyre", "Charlotte Bronte", "Gothic", 1847, "Images/Jane_Eyre.jpg");
                Book Book_13 = new Book(13, "Animal Farm", "George Orwell", "Political satire", 1945, "Images/Animal_Farm.jpg");
                Book Book_14 = new Book(14, "Gone with the Wind", "Margaret Mitchell", "Historical Fiction", 1936, "Images/Gone_with_the_Wind.jpg");
                Book Book_15 = new Book(15, "The Catcher in the Rye", "J.D. Salinger", "Realistic fiction", 1951, "Images/The_Catcher_in_the_Rye.jpg");

                Book Book_16 = new Book(16, "Charlotte’s Web", "E.B. White", "Children's", 1952, "Images/Charlottes_Web.jpg");
                Book Book_17 = new Book(17, "The Lion, the Witch, and the Wardrobe", "C.S. Lewis", "Children's Fantasy", 1950, "Images/The_Lion_the_Witch_and_the_Wardrobe.jpg");
                Book Book_18 = new Book(18, "The Grapes of Wrath", "John Steinbeck", "Novel", 1939, "Images/The_Grapes_of_Wrath.jpg");
                Book Book_19 = new Book(19, "Lord of the Flies", "William Golding", "Allegorical Novel", 1954, "Images/Lord_of_the_Flies.jpg");
                Book Book_20 = new Book(20, "The Kite Runner", "Khaled Hosseini", "Historical Fiction", 2003, "Images/The_Kite_Runner.jpg");

                Book Book_21 = new Book(21, "Of Mice and Men", "John Steinbeck", "Novella", 1937, "Images/Of_Mice_and_Men.jpg");
                Book Book_22 = new Book(22, "A Tale of Two Cities", "Charles Dickens", "Historical Novel", 1859, "Images/A_Tale_of_Two_Cities.jpg");
                Book Book_23 = new Book(23, "Romeo and Juliet", "William Shakespeare", "Tragedy", 1597, "Images/Romeo_and_Juliet.jpg");
                Book Book_24 = new Book(24, "The Hitchhiker’s Guide to the Galaxy", "Douglas Adams", "Comic Science Fiction", 1979, "Images/The_Hitchhikers_Guide_to_the_Galaxy.jpg");
                Book Book_25 = new Book(25, "Wuthering Heights", "Emily Bronte", "Tragedy", 1847, "Images/Wuthering_Heights.jpg");

                Book Book_26 = new Book(26, "The Color Purple", "Alice Walker", "Epistolary Novel", 1982, "Images/The_Color_Purple.jpg");
                Book Book_27 = new Book(27, "Alice's Adventures in Wonderland", "Lewis Carroll", "Fantasy", 1865, "Images/Alices_Adventures_in_Wonderland.jpg");
                Book Book_28 = new Book(28, "Frankenstein", "Mary Shelley", "Gothic Novel", 1818, "Images/Frankenstein.jpg");
                Book Book_29 = new Book(29, "The Adventures of Huckleberry Finn", "Mark Twain", "Picaresque Novel", 1884, "Images/The_Adventures_of_Huckleberry_Finn.jpg");
                Book Book_30 = new Book(30, "Slaughterhouse-Five", "Kurt Vonnegut", "Dark Comedy", 1969, "Images/Slaughterhouse_Five.jpg");

                // Add books to the ArrayList
                All_BookIndices.Add(Book_1);
                All_BookIndices.Add(Book_2);
                All_BookIndices.Add(Book_3);
                All_BookIndices.Add(Book_4);
                All_BookIndices.Add(Book_5);

                All_BookIndices.Add(Book_6);
                All_BookIndices.Add(Book_7);
                All_BookIndices.Add(Book_8);
                All_BookIndices.Add(Book_9);
                All_BookIndices.Add(Book_10);

                All_BookIndices.Add(Book_11);
                All_BookIndices.Add(Book_12);
                All_BookIndices.Add(Book_13);
                All_BookIndices.Add(Book_14);
                All_BookIndices.Add(Book_15);

                All_BookIndices.Add(Book_16);
                All_BookIndices.Add(Book_17);
                All_BookIndices.Add(Book_18);
                All_BookIndices.Add(Book_19);
                All_BookIndices.Add(Book_20);

                All_BookIndices.Add(Book_21);
                All_BookIndices.Add(Book_22);
                All_BookIndices.Add(Book_23);
                All_BookIndices.Add(Book_24);
                All_BookIndices.Add(Book_25);

                All_BookIndices.Add(Book_26);
                All_BookIndices.Add(Book_27);
                All_BookIndices.Add(Book_28);
                All_BookIndices.Add(Book_29);
                All_BookIndices.Add(Book_30);

                Session["Info_Book"] = All_BookIndices;

                // Add books to the cart using Add_Book_Cart method with Book objects
                Add_Book_Cart(Book_1);
                Add_Book_Cart(Book_2);
                Add_Book_Cart(Book_3);
                Add_Book_Cart(Book_4);
                Add_Book_Cart(Book_5);

                Add_Book_Cart(Book_6);
                Add_Book_Cart(Book_7);
                Add_Book_Cart(Book_8);
                Add_Book_Cart(Book_9);
                Add_Book_Cart(Book_10);

                Add_Book_Cart(Book_11);
                Add_Book_Cart(Book_12);
                Add_Book_Cart(Book_13);
                Add_Book_Cart(Book_14);
                Add_Book_Cart(Book_15);

                Add_Book_Cart(Book_16);
                Add_Book_Cart(Book_17);
                Add_Book_Cart(Book_18);
                Add_Book_Cart(Book_19);
                Add_Book_Cart(Book_20);

                Add_Book_Cart(Book_21);
                Add_Book_Cart(Book_22);
                Add_Book_Cart(Book_23);
                Add_Book_Cart(Book_24);
                Add_Book_Cart(Book_25);

                Add_Book_Cart(Book_26);
                Add_Book_Cart(Book_27);
                Add_Book_Cart(Book_28);
                Add_Book_Cart(Book_29);
                Add_Book_Cart(Book_30);
            }
            else
            {
                Panel_Info.Visible = true;
                Panel_User_Info.Visible = false;
                Panel_Book.Visible = false;
            }
        }
        public void Add_Book_Cart(Book book)
        {
            HtmlGenericControl div_card = new HtmlGenericControl("div");
            div_card.Attributes.Add("class", "card bg-light text-center");

            HtmlGenericControl div_card_body = new HtmlGenericControl("div");
            div_card_body.Attributes.Add("class", "card-body d-flex flex-column align-items-center");

            // Create an ImageButton for the book
            ImageButton btn_book = new ImageButton();
            btn_book.ID = "ImageButton" + book.BookId.ToString();
            btn_book.CssClass = "card-img-top";
            btn_book.Click += book_Click;
            btn_book.Width = 300;
            btn_book.Height = 400;
            btn_book.ImageUrl = book.BookUrl;

            // Create a Label for the title
            Label lbl_title = new Label();
            lbl_title.ID = "Label_Title" + book.BookId.ToString();
            lbl_title.Text = book.Title;
            lbl_title.CssClass = "card-title";
            lbl_title.Font.Bold = true;

            // Add ImageButton and Label to the card body
            div_card_body.Controls.Add(btn_book);
            div_card_body.Controls.Add(new LiteralControl("<br />")); 
            div_card_body.Controls.Add(lbl_title);

            // Add the card body to the card
            div_card.Controls.Add(div_card_body);

            // Add the card to the Panel element
            Panel_element.Controls.Add(div_card);
        }
        protected void btn_log_out_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("UserInfo");
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("Default.aspx");
        }
        protected void img_shopping_cart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
        protected void book_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton send = (ImageButton)sender;
            String id = send.ID;

            // Extract the ID 
            if (id.Length == 12) 
                id = id.Substring(id.Length - 1);
            else 
                id = id.Substring(id.Length - 2);

            // Redirect to the BookInfo.aspx page with the extracted ID as query string
            Response.Redirect("BookInfo.aspx?id=" + id);
        }
    }
}