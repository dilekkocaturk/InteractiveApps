<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HangmanGame.aspx.cs" Inherits="HangmanGame.HangmanGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hangman Game</title>
    <style>
        body {
            text-align: center;
            background-color: beige;
        }
        .gifRight{
            position: absolute;
            top: 200px;
            left: 1020px;
        }
        .gifLeft{
            position: absolute;
            top: 200px;
            left: 20px;
        }
        .button {
            margin: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Hangman Game</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>  
            <asp:Button ID="btnPlayAgain" runat="server" Text="Play Again" OnClick="btnPlayAgain_Click" />          
            <asp:Timer ID="tmrCountDown" runat="server" Interval="1000" OnTick="tmrCountDown_Tick" ></asp:Timer>
            <asp:Label ID="lblReTime" runat="server" Text="Remaining Time(s):"></asp:Label>
            <asp:Label ID="lblCountDown" runat="server"></asp:Label>
        </ContentTemplate>
        </asp:UpdatePanel>          
        <h3>Guess the word before the hangman is completed!</h3>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>    
        <div class="button">
            <asp:Button ID="btnHint" runat="server" Text="Hint" OnClick="btnHint_Click"/>
            <asp:Label ID="lblHint" runat="server" Text="" Visible="false" ></asp:Label>
        </div>
        <asp:Image ID="imgHangman" runat="server" CssClass="button"/>    
        <div>
            <asp:Label ID="lblWord" runat="server" Text=""></asp:Label>
        </div>       
        <div id="pnlButtons" runat="server">
            <div class="button">
            <asp:Button ID="btnA" runat="server" Text="A" OnClick="btnGuess_Click" />
            <asp:Button ID="btnB" runat="server" Text="B" OnClick="btnGuess_Click" />
            <asp:Button ID="btnC" runat="server" Text="C" OnClick="btnGuess_Click" />
            <asp:Button ID="btnC2" runat="server" Text="Ç" OnClick="btnGuess_Click" />
            <asp:Button ID="btnD" runat="server" Text="D" OnClick="btnGuess_Click" />
            <asp:Button ID="btnE" runat="server" Text="E" OnClick="btnGuess_Click" />
            <asp:Button ID="btnF" runat="server" Text="F" OnClick="btnGuess_Click" />
            <asp:Button ID="btnG" runat="server" Text="G" OnClick="btnGuess_Click" />
            <asp:Button ID="btnG2" runat="server" Text="Ğ" OnClick="btnGuess_Click" />
            <asp:Button ID="btnH" runat="server" Text="H" OnClick="btnGuess_Click" />
            </div>
            <div class="button">
            <asp:Button ID="btnI" runat="server" Text="I" OnClick="btnGuess_Click" />
            <asp:Button ID="btnI2" runat="server" Text="İ" OnClick="btnGuess_Click" />
            <asp:Button ID="btnJ" runat="server" Text="J" OnClick="btnGuess_Click" />
            <asp:Button ID="btnK" runat="server" Text="K" OnClick="btnGuess_Click" />
            <asp:Button ID="btnL" runat="server" Text="L" OnClick="btnGuess_Click" />
            <asp:Button ID="btnM" runat="server" Text="M" OnClick="btnGuess_Click" />
            <asp:Button ID="btnN" runat="server" Text="N" OnClick="btnGuess_Click" />
            <asp:Button ID="btnO" runat="server" Text="O" OnClick="btnGuess_Click" />
            <asp:Button ID="btnO2" runat="server" Text="Ö" OnClick="btnGuess_Click" />
            <asp:Button ID="btnP" runat="server" Text="P" OnClick="btnGuess_Click" />
            </div>
            <div class="button">
            <asp:Button ID="btnR" runat="server" Text="R" OnClick="btnGuess_Click" />
            <asp:Button ID="btnS" runat="server" Text="S" OnClick="btnGuess_Click" />
            <asp:Button ID="btnS2" runat="server" Text="Ş" OnClick="btnGuess_Click" />
            <asp:Button ID="btnT" runat="server" Text="T" OnClick="btnGuess_Click" />
            <asp:Button ID="btnU" runat="server" Text="U" OnClick="btnGuess_Click" />
            <asp:Button ID="btnU2" runat="server" Text="Ü" OnClick="btnGuess_Click" />
            <asp:Button ID="btnV" runat="server" Text="V" OnClick="btnGuess_Click" />
            <asp:Button ID="btnY" runat="server" Text="Y" OnClick="btnGuess_Click" />
            <asp:Button ID="btnZ" runat="server" Text="Z" OnClick="btnGuess_Click" />
            </div>
        </div>
        <div>
            <asp:Label ID="lblResult" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>     
        <div>
            <asp:Image ID="imgGifRight" runat="server" CssClass="gifRight" />
        </div>
        <div>
            <asp:Image ID="imgGifLeft" runat="server" CssClass="gifLeft" />
        </div>    
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>