<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WeatherForecast.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        .container.text-center {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .welcome-heading {
            font-family: "Arial", sans-serif;
            font-size: 32px;
            color: #008080;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .welcome-message {
            font-family: "Arial", sans-serif;
            font-size: 18px;
            color: #008080;
        }

        .table > tbody > tr:first-child > td {
            border: none;
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
            <div class="container card  border-info border-top-0 border-left-0 border-right-0" style="border-width: 2px;">
                <nav class="navbar navbar-expand-lg navbar-light ">
                       <label class="p-2 text-muted" for="ddlCities">İl Seç</label>
            <asp:DropDownList ID="ddlCities" class="p-2 text-muted" AppendDataBoundItems="true" runat="server">
                <asp:ListItem Text="Seçiniz" Value=""></asp:ListItem>
                <asp:ListItem Value="Adana">Adana</asp:ListItem>
                <asp:ListItem Value="Adıyaman">Adıyaman</asp:ListItem>
                <asp:ListItem Value="Afyonkarahisar">Afyonkarahisar</asp:ListItem>
                <asp:ListItem Value="Ağrı">Ağrı</asp:ListItem>
                <asp:ListItem Value="Aksaray">Aksaray</asp:ListItem>
                <asp:ListItem Value="Amasya">Amasya</asp:ListItem>
                <asp:ListItem Value="Ankara">Ankara</asp:ListItem>
                <asp:ListItem Value="Antalya">Antalya</asp:ListItem>
                <asp:ListItem Value="Ardahan">Ardahan</asp:ListItem>
                <asp:ListItem Value="Artvin">Artvin</asp:ListItem>
                <asp:ListItem Value="Aydın">Aydın</asp:ListItem>
                <asp:ListItem Value="Balıkesir">Balıkesir</asp:ListItem>
                <asp:ListItem Value="Bartın">Bartın</asp:ListItem>
                <asp:ListItem Value="Batman">Batman</asp:ListItem>
                <asp:ListItem Value="Bayburt">Bayburt</asp:ListItem>
                <asp:ListItem Value="Bilecik">Bilecik</asp:ListItem>
                <asp:ListItem Value="Bingöl">Bingöl</asp:ListItem>
                <asp:ListItem Value="Bitlis">Bitlis</asp:ListItem>
                <asp:ListItem Value="Bolu">Bolu</asp:ListItem>
                <asp:ListItem Value="Burdur">Burdur</asp:ListItem>
                <asp:ListItem Value="Bursa">Bursa</asp:ListItem>
                <asp:ListItem Value="Çanakkale">Çanakkale</asp:ListItem>
                <asp:ListItem Value="Çankırı">Çankırı</asp:ListItem>
                <asp:ListItem Value="Çorum">Çorum</asp:ListItem>
                <asp:ListItem Value="Denizli">Denizli</asp:ListItem>
                <asp:ListItem Value="Diyarbakır">Diyarbakır</asp:ListItem>
                <asp:ListItem Value="Düzce">Düzce</asp:ListItem>
                <asp:ListItem Value="Edirne">Edirne</asp:ListItem>
                <asp:ListItem Value="Elazığ">Elazığ</asp:ListItem>
                <asp:ListItem Value="Erzincan">Erzincan</asp:ListItem>
                <asp:ListItem Value="Erzurum">Erzurum</asp:ListItem>
                <asp:ListItem Value="Eskişehir">Eskişehir</asp:ListItem>
                <asp:ListItem Value="Gaziantep">Gaziantep</asp:ListItem>
                <asp:ListItem Value="Giresun">Giresun</asp:ListItem>
                <asp:ListItem Value="Gümüşhane">Gümüşhane</asp:ListItem>
                <asp:ListItem Value="Hakkari">Hakkari</asp:ListItem>
                <asp:ListItem Value="Hatay">Hatay</asp:ListItem>
                <asp:ListItem Value="Iğdır">Iğdır</asp:ListItem>
                <asp:ListItem Value="Isparta">Isparta</asp:ListItem>
                <asp:ListItem Value="İstanbul">İstanbul</asp:ListItem>
                <asp:ListItem Value="İzmir">İzmir</asp:ListItem>
                <asp:ListItem Value="Kahramanmaraş">Kahramanmaraş</asp:ListItem>
                <asp:ListItem Value="Karabük">Karabük</asp:ListItem>
                <asp:ListItem Value="Karaman">Karaman</asp:ListItem>
                <asp:ListItem Value="Kars">Kars</asp:ListItem>
                <asp:ListItem Value="Kastamonu">Kastamonu</asp:ListItem>
                <asp:ListItem Value="Kayseri">Kayseri</asp:ListItem>
                <asp:ListItem Value="Kırıkkale">Kırıkkale</asp:ListItem>
                <asp:ListItem Value="Kırklareli">Kırklareli</asp:ListItem>
                <asp:ListItem Value="Kırşehir">Kırşehir</asp:ListItem>
                <asp:ListItem Value="Kilis">Kilis</asp:ListItem>
                <asp:ListItem Value="Kocaeli">Kocaeli</asp:ListItem>
                <asp:ListItem Value="Konya">Konya</asp:ListItem>
                <asp:ListItem Value="Kütahya">Kütahya</asp:ListItem>
                <asp:ListItem Value="Malatya">Malatya</asp:ListItem>
                <asp:ListItem Value="Manisa">Manisa</asp:ListItem>
                <asp:ListItem Value="Mardin">Mardin</asp:ListItem>
                <asp:ListItem Value="Mersin">Mersin</asp:ListItem>
                <asp:ListItem Value="Muğla">Muğla</asp:ListItem>
                <asp:ListItem Value="Muş">Muş</asp:ListItem>
                <asp:ListItem Value="Nevşehir">Nevşehir</asp:ListItem>
                <asp:ListItem Value="Niğde">Niğde</asp:ListItem>
                <asp:ListItem Value="Ordu">Ordu</asp:ListItem>
                <asp:ListItem Value="Osmaniye">Osmaniye</asp:ListItem>
                <asp:ListItem Value="Rize">Rize</asp:ListItem>
                <asp:ListItem Value="Sakarya">Sakarya</asp:ListItem>
                <asp:ListItem Value="Samsun">Samsun</asp:ListItem>
                <asp:ListItem Value="Siirt">Siirt</asp:ListItem>
                <asp:ListItem Value="Sinop">Sinop</asp:ListItem>
                <asp:ListItem Value="Sivas">Sivas</asp:ListItem>
                <asp:ListItem Value="Şanlıurfa">Şanlıurfa</asp:ListItem>
                <asp:ListItem Value="Şırnak">Şırnak</asp:ListItem>
                <asp:ListItem Value="Tekirdağ">Tekirdağ</asp:ListItem>
                <asp:ListItem Value="Tokat">Tokat</asp:ListItem>
                <asp:ListItem Value="Trabzon">Trabzon</asp:ListItem>
                <asp:ListItem Value="Tunceli">Tunceli</asp:ListItem>
                <asp:ListItem Value="Uşak">Uşak</asp:ListItem>
                <asp:ListItem Value="Van">Van</asp:ListItem>
                <asp:ListItem Value="Yalova">Yalova</asp:ListItem>
                <asp:ListItem Value="Yozgat">Yozgat</asp:ListItem>
                <asp:ListItem Value="Zonguldak">Zonguldak</asp:ListItem>
            </asp:DropDownList>
                     <span style="margin-left: 10px;"></span>
            <asp:Button ID="btnSearch" runat="server" class="p-2 text-white btn btn-info" Text="Ara" OnClick="btnSearch_Click" />
                    <span style="margin-left: 100px;"></span>
                    <a class="p-2 text-muted" href="Aegean.aspx">Ege</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="Marmara.aspx">Marmara</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="Mediterranean.aspx">Akdeniz</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="BlackSea.aspx">Karadeniz</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="CentralAnatolia.aspx">İç Anadolu</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="EasternAnatolia.aspx">Doğu Anadolu</a>
                     <span style="margin-left: 10px;"></span>
                    <a class="p-2 text-muted" href="SoutheasternAnatolia.aspx">Güneydoğu Anadolu</a>
                </nav>
            </div>
        </header>
        <div>
            <div class="container text-center">
                <h2 class="welcome-heading">Hoş Geldiniz!</h2>
                <p class="welcome-heading">Bu web sitesi üzerinden hava durumu bilgilerini kontrol edebilirsiniz.</p>
            </div>
        </div>
    </form>
</body>
</html>