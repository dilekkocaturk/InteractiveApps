﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bookstore.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="#">
                        <img src="https://icons.iconarchive.com/icons/google/noto-emoji-objects/256/62863-books-icon.png" width="30" height="30" alt="">
                    </a>
                    <a class="navbar-brand" href="Default.aspx" class="text-primary font-weight-bold">B O O K S T O R E</a>
                </div>
            </nav>
        </header>
        <div>
            <br />
            <asp:Panel ID="Panel_Info" runat="server">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_info" runat="server" CssClass="text-success" Text="You are not logged in. Please "></asp:Label>
                &nbsp;<asp:HyperLink ID="hlbl_link" Navigate="Login.aspx" runat="server" CssClass="text-warning" Text="login." NavigateUrl="~/Login.aspx"></asp:HyperLink>
            </asp:Panel>
        </div>
        <div class="container-fluid card-deck">
            <div class="row">
                <div class="col-2">
                    <asp:Panel ID="Panel_User_Info" runat="server">
                        <div class="card text-center">
                            <div class="card-body">
                                <div>
                                    <asp:Image ID="img_user" runat="server" src="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-2/128/man-icon.png" Width="30" Height="30" CssClass="center" />
                                    <asp:Label ID="lbl_welcome" runat="server" Text=" Welcome " CssClass="text-primary"></asp:Label><br />
                                    <asp:Label ID="lbl_user_name" runat="server" Text="Label" CssClass="text-primary"></asp:Label>
                                </div>
                                <br />
                                <asp:ImageButton ID="img_shopping_cart" runat="server" src="http://icons.iconarchive.com/icons/fasticon/shop-cart/128/shop-cart-icon.png" Width="50" Height="50" OnClick="img_shopping_cart_Click" />
                                <br />
                                <asp:Button ID="btn_log_out" runat="server" Text="Log Out" CssClass="btn btn-primary btn-block" BackColor="#E3F2FD" BorderColor="#E3F2FD" ClientIDMode="Predictable" ForeColor="Black" OnClick="btn_log_out_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="col-10 text-center">
                    <asp:Panel ID="Panel_Book" runat="server">
                        <div class="card-columns">
                            <asp:Panel ID="Panel_element" runat="server">
                            </asp:Panel>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>