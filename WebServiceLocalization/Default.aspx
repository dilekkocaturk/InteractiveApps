<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebServiceLocalization.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .form-container {
            border: 2px solid #ccc;
            background-color: #f7f7f7;
            padding: 20px;
            width: 500px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container > * {
            margin-bottom: 10px;
        }

        .form-container .form-row {
            display: flex;
            justify-content: space-between;
        }

        .form-container .form-row .label-column {
            width: 100px;
            text-align: right;
        }

        .form-container .form-row .input-column {
            flex-grow: 1;
            margin-left: 10px;
        }

        .form-container .form-row .input-column input[type="text"] {
            width: 100%;
        }

        .form-container .form-row .input-column .button-column {
            margin-top: 10px;
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

        body {
            text-align: center;
            background-color: #F7EFEF; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div>
                <asp:HyperLink ID="lnkTurkish" runat="server" NavigateUrl="?lang=tr" Text="Türkçe"></asp:HyperLink>
                <asp:HyperLink ID="lnkEnglish" runat="server" NavigateUrl="?lang=en" Text="English"></asp:HyperLink>
            </div>
            <h1><asp:Label ID="litWelcomeMessage" runat="server"></asp:Label></h1>
            <hr />
            <h2><asp:Label ID="litStudentInfo" runat="server"></asp:Label></h2>
            <div class="gridview">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" />
                        <asp:BoundField DataField="surname" HeaderText="surname" />
                        <asp:BoundField DataField="age" HeaderText="age" />
                        <asp:BoundField DataField="department" HeaderText="department" />
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <h3><asp:Label ID="litAddNewStudent" runat="server"></asp:Label></h3>
            <div class="form-row">
                <div class="label-column">
                    <asp:Literal ID="litName" runat="server"></asp:Literal>
                </div>
                <div class="input-column">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>
                <div class="label-column">
                    <asp:Literal ID="litSurname" runat="server"></asp:Literal>
                </div>
                <div class="input-column">
                    <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div class="label-column">
                    <asp:Literal ID="litAge" runat="server"></asp:Literal>
                </div>
                <div class="input-column">
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                </div>
                <div class="label-column">
                    <asp:Literal ID="litDepartment" runat="server"></asp:Literal>
                </div>
                <div class="input-column">
                    <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="form-row">
                <div class="input-column button-column">
                    <asp:Button ID="btnSaveStudent" runat="server" OnClick="btnSaveStudent_Click"></asp:Button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>