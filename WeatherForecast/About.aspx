<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WeatherForecast.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        .content-wrapper {
            background-color: rgba(255, 255, 255, 1);
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
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
        <div class="content-wrapper">
            <br />
            <h1 class="text-center">HAKKIMIZDA</h1>
            <hr />
            <div class="container">
                <p>Şirketimiz, hava durumu bilgilerini kullanıcılara sunmayı amaçlayan bir platformdur. Amacımız, kullanıcılara doğru, güncel ve detaylı hava durumu verilerini sağlamak ve onlara bilinçli kararlar almalarında yardımcı olmaktır.
                    Platformumuz üzerinden 10.06.2023 tarihine ait Türkiye'nin tüm illerine ve bölgelerine ait hava durumu bilgilerine ulaşabilirsiniz.
                </p>
                <p>Tecrübeli bir ekip tarafından geliştirilen bu platform, kullanıcı dostu arayüzü ve hassas veri analiziyle öne çıkmaktadır. Hava durumu bilgilerini doğrudan kaynaklardan alarak güvenilirlik ve doğruluk konusunda özen gösteriyoruz.</p>
                <p>Müşteri memnuniyeti bizim önceliğimizdir ve kullanıcıların ihtiyaçlarını karşılamak için sürekli olarak hizmetlerimizi geliştiriyoruz. Ayrıca, geri bildirimleri dikkate alarak platformumuzu daha kullanıcı odaklı hale getirmek için çalışıyoruz.</p>
            </div>
        </div>
    </form>
</body>
</html>