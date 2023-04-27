<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCardValidation.aspx.cs" Inherits="CreditCardValidation.CreditCardValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Credit Card Validation</title>
    <style>
        body {
            background-image: url("https://www.paymentsjournal.com/wp-content/uploads/2017/05/Fotolia_90732811_Subscription_Monthly_M.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
            text-align: center;
        }
        .card-icon {
            position: absolute;
            top: 350px;
            left: 830px;
        }
        .card-number {
            position: absolute;
            top: 448px;
            left: 668px;
            font-size: 17px;
            font-weight: bold;
            color: white;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }
        .name-on-card {
            position: absolute;
            top: 490px;
            left: 668px;
            font-size: 17px;
            font-weight: bold;
            color: white;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }
        .exp {
            position: absolute;
            top: 490px;
            left: 830px;
            font-size: 13px;
            font-weight: bold;
            color: white;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }
    </style>
</head>
<body> 
    <form id="form1" runat="server">
        <div>     
            <h1>Credit Card Information</h1>
            <p>
                <label for="txtNameOnCard">Name on Card:</label>
                <asp:TextBox ID="txtNameOnCard" runat="server" onkeypress="var regex = /^[a-zA-Z\s]*$/; return regex.test(String.fromCharCode(event.charCode)) || event.keyCode == 13;"></asp:TextBox>
            </p>
            <p>
                <label for="txtCardNumber">Card Number:</label>
                <asp:TextBox ID="txtCardNumber" runat="server" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) || event.keyCode == 13"></asp:TextBox>
            </p>
            <p>
                <label for="ddlExpirationMonth">Expiry Date (mm/yyyy):</label>
                <asp:DropDownList ID="ddlExpirationMonth" runat="server">
                    <asp:ListItem Value="01">01</asp:ListItem>
                    <asp:ListItem Value="02">02</asp:ListItem>
                    <asp:ListItem Value="03">03</asp:ListItem>
                    <asp:ListItem Value="04">04</asp:ListItem>
                    <asp:ListItem Value="05">05</asp:ListItem>
                    <asp:ListItem Value="06">06</asp:ListItem>
                    <asp:ListItem Value="07">07</asp:ListItem>
                    <asp:ListItem Value="08">08</asp:ListItem>
                    <asp:ListItem Value="09">09</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlExpirationYear" runat="server">
                    <asp:ListItem Value="2022">2022</asp:ListItem>
                    <asp:ListItem Value="2023">2023</asp:ListItem>
                    <asp:ListItem Value="2024">2024</asp:ListItem>
                    <asp:ListItem Value="2025">2025</asp:ListItem>
                    <asp:ListItem Value="2026">2026</asp:ListItem>
                    <asp:ListItem Value="2027">2027</asp:ListItem>
                    <asp:ListItem Value="2028">2028</asp:ListItem>
                    <asp:ListItem Value="2029">2029</asp:ListItem>
                    <asp:ListItem Value="2030">2030</asp:ListItem>
                    <asp:ListItem Value="2031">2031</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                <label for="txtCVV">CVV:</label>
                <asp:TextBox ID="txtCVV" runat="server" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) || event.keyCode == 13"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </p>
            <p>
                <label for="lblResult"></label>
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </p>          
            <div>
            <asp:Image ID="imgCard" runat="server" ImageUrl="https://img.icons8.com/ios-filled/256/credit-card-front.png" />
            </div>
            <asp:Label ID="lblCardNumber" runat="server" CssClass="card-number"></asp:Label>
            <asp:Label ID="lblNameOnCard" runat="server" CssClass="name-on-card"></asp:Label>
            <asp:Label ID="lblExp" runat="server" CssClass="exp"></asp:Label>
            <div>
            <asp:Image ID="imgIcon" runat="server" CssClass="card-icon" Width="50" Height="50" Visible="false" />
            </div>
        </div>
    </form>
</body>
</html>