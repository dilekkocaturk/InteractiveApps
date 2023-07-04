<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mediterranean.aspx.cs" Inherits="WeatherForecast.Mediterranean" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mediterranean</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        .gridview-style {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: center;
        }

        .gridview-style th {
            background-color: #008080;
            font-weight: bold;
            padding: 10px;
            color: #fff; 
        }

        .gridview-style td {
            padding: 10px;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #E0FFFF; 
        }

        .gridview-style tr:hover {
            background-color: #00CED1; 
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <nav class="navbar navbar-expand-lg navbar-light bg-info">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <a class="navbar-brand" href="#">
                            <img src="https://icons.iconarchive.com/icons/icons8/ios7/256/Weather-Partly-Cloudy-Rain-icon.png" width="40" height="40" alt=""/>
                        </a>
                        <a class="navbar-brand text-white font-weight-bold" href="Default.aspx">HAVA DURUMU</a>
                    </div>
                    <div class="text-right">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="p-2 text-white" href="About.aspx">HAKKIMIZDA</a>
                            <a class="p-2 text-white" href="Contact.aspx">İLETİŞİM</a>
                        </nav>
                    </div>
                </nav>
            </header>
        </div>
        <div class="container mt-5">
            <h2 class="text-center">Akdeniz Bölgesi Hava Durumu</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CssClass="gridview-style">
               <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Image ID="imgWeatherIcon" runat="server" Width="40" Height="40" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="City" HeaderText="İl" />
                    <asp:BoundField DataField="WeatherDate" HeaderText="Tarih" />
                    <asp:BoundField DataField="Description" HeaderText="Beklenen Hadise" />
                    <asp:BoundField DataField="Temperature" HeaderText="Sıcaklık (°)" />
                    <asp:BoundField DataField="Humidity" HeaderText="Nem (%)" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Oo3BqWc8O/D85GqD5w7oRX6mu6s4LORc5F82p0K/pA5pD" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-vtG0OhYy8ej9zdTmJ+g5F3mH+WtoYmOwkAVzR5MAGoVC9SFXH/+UYIQwN5pVghUj" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>