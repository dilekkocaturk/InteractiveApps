using System;
using System.Data.OleDb;

namespace WeatherForecast
{
    public partial class SelectedCity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get user selected city name
            string selectedCity = Request.QueryString["city"];
            lblCityHeader.Text = selectedCity;

            // Specify the path to the Access database file
            string databasePath = Server.MapPath("~/App_Data/weather.mdb");
            string connectionString = $"Provider=Microsoft.Jet.OLEDB.4.0;Data Source={databasePath}";

            // Create database connection
            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                // Prepare the SQL query
                string query = $"SELECT * FROM Weather WHERE City = '{selectedCity}'";

                // Open database connection
                connection.Open();

                // Pull data from database
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    using (OleDbDataReader reader = command.ExecuteReader())
                    {
                        // Get values ​​of first columns
                        if (reader.Read())
                        {
                            string city = reader["City"].ToString();
                            DateTime weatherDateTime = Convert.ToDateTime(reader["WeatherDate"]);
                            string weatherDate = weatherDateTime.ToShortDateString();
                            string description = reader["Description"].ToString();
                            string temperature = reader["Temperature"].ToString();
                            string humidity = reader["Humidity"].ToString();

                            // Assign values ​​to tags on web page
                            lblCityName.Text = city;
                            lblWeatherDate.Text = weatherDate;
                            lblDescription.Text = description;
                            lblTemperature.Text = temperature;
                            lblHumidity.Text = humidity;

                            switch (description) {
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
        }
    }
}