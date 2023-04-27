<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IMDbComedyMovies.aspx.cs" Inherits="IMDbComedyMovies.IMDbComedyMovies" %>

<!DOCTYPE html>

<html>
<head>
    <title>IMDb Comedy Movies</title>
    <style>
        body {
            text-align: center;
            background-color: #F7EFEF; 
        }
        .adLeft {
            position: absolute;
            top: 225px;
            left: 40px;
        }
        .adRight {
            position: absolute;
            top: 225px;
            left: 1230px;
        }
        .gridview {
            text-align: center;
            margin: 0 auto;
            margin-top: 10px;
            font-size: 14px;
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
        }
        .gridview th {
            background-color: #6B5B95; 
            color: white;
            padding: 8px;
        }
        .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .gridview tr:nth-child(odd) {
            background-color: #D1C4E9; 
        }
        .gridview tr:nth-child(even) {
            background-color: #F7EFEF; 
        }
        .gridview tr:hover {
            background-color: #B39DDB; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Top 50 Comedy Movies - IMDb</h1>

        <div>
            <asp:AdRotator ID="adRotatorLeft" runat="server" AdvertisementFile="~/ads.xml" Width="250" Height="180" CssClass="adLeft" KeywordFilter="left" />
        </div>
        <div>
            <asp:AdRotator ID="adRotatorRight" runat="server" AdvertisementFile="~/ads.xml" Width="250" Height="180" CssClass="adRight" KeywordFilter="right" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" CssClass="gridview" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image") %>' Width="100" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="Title" ItemStyle-Width="310px">
                        <ItemStyle Width="310px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Year" ItemStyle-Width="70px">
                        <ItemStyle Width="70px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="runtimeStr" HeaderText="Duration" ItemStyle-Width="80px">
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="imDbRating" HeaderText="IMDb Rating" ItemStyle-Width="90px">
                        <ItemStyle Width="90px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="imDbRatingVotes" HeaderText="IMDb Rating Votes" ItemStyle-Width="100px">
                        <ItemStyle Width="100px"></ItemStyle>
                     </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>