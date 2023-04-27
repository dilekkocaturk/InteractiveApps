using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookstore
{
    public class Book
    {
        public int BookId;
        public string Title;
        public string Author;
        public string Genre;
        public int Year;
        public string BookUrl;
  
        public Book(int BookId, string Title, string Author, string Genre, int Year, string BookUrl)
        {
            this.BookId = BookId;
            this.Title = Title;
            this.Author = Author;
            this.Genre = Genre;
            this.Year = Year;
            this.BookUrl = BookUrl;
        }
    }
}