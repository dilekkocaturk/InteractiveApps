<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WeatherForecast.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
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
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6">
                        <h2>İletişim Formu</h2>
                        <p>Bizimle iletişime geçmek için aşağıdaki formu doldurun.</p>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="txtName">Adınız:</label>
                                <input type="text" id="txtName" name="name" class="form-control" placeholder="Adınızı girin" required />
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="txtEmail">E-posta Adresiniz:</label>
                                <input type="email" id="txtEmail" name="email" class="form-control" placeholder="E-posta adresinizi girin" required />
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="txtMessage">Mesajınız:</label>
                                <textarea id="txtMessage" name="message" class="form-control" rows="5" placeholder="Mesajınızı girin" required></textarea>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-info">Gönder</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h2>İletişim Bilgileri</h2>
                        <p>Aşağıdaki iletişim bilgilerinden bize ulaşabilirsiniz:</p>
                        <ul>
                            <li>Telefon: +90 123 456 789</li>
                            <li>E-posta: info@orneksirket.com</li>
                            <li>Adres: Örnek Sokak, No: 123, Örnek Şehir, Ülke</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>