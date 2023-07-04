using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeatherForecast
{
    public partial class CentralAnatolia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            // Specify the path to the Access database file
            string databasePath = Server.MapPath("~/App_Data/weather.mdb");
            string connectionString = $"Provider=Microsoft.Jet.OLEDB.4.0;Data Source={databasePath}";
            string query = "SELECT City, FORMAT(WeatherDate, 'Short Date') AS WeatherDate, Description, Temperature, Humidity FROM Weather WHERE City IN ('Yozgat', 'Sivas', 'Nevşehir', 'Niğde', 'Kayseri', 'Karaman', 'Konya', 'Kırşehir', 'Aksaray', 'Ankara', 'Eskişehir', 'Çankırı', 'Kırıkkale')";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string description = DataBinder.Eval(e.Row.DataItem, "Description").ToString();
                Image imgWeatherIcon = (Image)e.Row.FindControl("imgWeatherIcon");

                // Set pictures
                switch (description)
                {
                    case "Genel Olarak Açık":
                        imgWeatherIcon.ImageUrl = "https://icons.iconarchive.com/icons/ionic/ionicons/256/sunny-outline-icon.png";
                        break;
                    case "Parçalı Bulutlu":
                        imgWeatherIcon.ImageUrl = "https://icons.iconarchive.com/icons/pixelkit/swanky-outlines/256/13-Partly-Cloudy-icon.png";
                        break;
                    case "Bulutlu":
                        imgWeatherIcon.ImageUrl = "https://icons.iconarchive.com/icons/iconsmind/outline/256/Cloud-icon.png";
                        break;
                    case "Çok Bulutlu":
                        imgWeatherIcon.ImageUrl = "https://icons.iconarchive.com/icons/iconsmind/outline/256/Clouds-icon.png";
                        break;
                    default: // in rainy weather
                        imgWeatherIcon.ImageUrl = "https://icons.iconarchive.com/icons/ionic/ionicons/256/thunderstorm-outline-icon.png";
                        break;
                }
            }
        }
    }
}