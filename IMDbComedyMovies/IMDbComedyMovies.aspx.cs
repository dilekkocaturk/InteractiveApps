using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.UI.WebControls;

namespace IMDbComedyMovies
{
    public partial class IMDbComedyMovies : System.Web.UI.Page
    {
        // List of comedy movies
        private List<dynamic> comedyMovies
        {
            get
            {
                if (Session["ComedyMovies"] == null)
                {
                    Session["ComedyMovies"] = new List<dynamic>();
                }
                return (List<dynamic>)Session["ComedyMovies"];
            }
            set { Session["ComedyMovies"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create IMDb data retrieval URL
                string url = "https://imdb-api.com/API/AdvancedSearch/{apiKey}?genres=comedy&groups=top_250&sort=user_rating,desc";

                // Retrieve IMDb data using WebClient
                using (WebClient client = new WebClient())
                {
                    string response = client.DownloadString(url);

                    // Deserialize JSON data dynamically
                    dynamic data = JsonConvert.DeserializeObject(response);

                    if (data != null && data.results != null && data.results.Count > 0)
                    {
                        // Take the first 50 comedy movies
                        JArray resultsArray = (JArray)data.results;
                        comedyMovies = resultsArray.ToObject<List<dynamic>>().Take(50).ToList();

                        // Bind the data to GridView control
                        BindGridData();
                    }
                }
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Event for pagination
            GridView1.PageIndex = e.NewPageIndex;
            BindGridData();
        }
        private void BindGridData()
        {
            // Bind GridView to the updated data source
            GridView1.DataSource = comedyMovies;
            GridView1.DataBind();
        }
    }
}