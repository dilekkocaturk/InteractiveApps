<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectedCity.aspx.cs" Inherits="WeatherForecast.SelectedCity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SelectedCity</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #008080;
            background-color: #f9f9f9;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .weather-info {
            margin-top: 20px;
            text-align: left;
        }

        .weather-info p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                 <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-info">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="#">
                        <img src="https://icons.iconarchive.com/icons/icons8/ios7/256/Weather-Partly-Cloudy-Rain-icon.png" width="40" height="40" alt=""/>
                    </a>
                    <a class="navbar-brand text-white font-weight-bold " href="Default.aspx">HAVA DURUMU</a>
                </div>
                <div class="text-right">
                       <nav class="navbar navbar-expand-lg navbar-light ">
                    <a class="p-2 text-white" href="About.aspx">HAKKIMIZDA</a>
                    <a class="p-2 text-white" href="Contact.aspx">İLETİŞİM</a>
                </nav> 
                </div>
            </nav>
        </header>
        <br />
        <div class="container">
            <h1><asp:Literal ID="lblCityHeader" runat="server" Text=""></asp:Literal> İçin Ayrıntılı Hava Durumu</h1>
            <div class="weather-info">
                <hr />
                <asp:Image ID="imgWeatherIcon" runat="server" AlternateText="Weather Icon" Width="100px" Height="100px" />
                <p><strong>İl:</strong> <asp:Label ID="lblCityName" runat="server" Text=""></asp:Label></p>
                <p><strong>Tarih:</strong> <asp:Label ID="lblWeatherDate" runat="server" Text=""></asp:Label></p>
                <p><strong>Beklenen Hadise:</strong> <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>
                <p><strong>Sıcaklık (°):</strong> <asp:Label ID="lblTemperature" runat="server" Text=""></asp:Label></p>
                <p><strong>Nem (%):</strong> <asp:Label ID="lblHumidity" runat="server" Text=""></asp:Label></p>
            </div>
        </div>
    </form>
</body>
</html>