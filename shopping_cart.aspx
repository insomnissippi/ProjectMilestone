<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Your home for stuff</title>
    <link rel="Stylesheet" type="text/css" href="css.css" />
    <style type="text/css">
    #mainpara 
    {
        padding: 5px 100px;
        font-style: italic;
        font-size: 1.3em;
    }
     #leftcolumn 
    {
        height: 300px;
        width: 450px;
      
        float: left;
        margin-left: 120px;
    }
    #rightcolumn 
    {
        height: 300px;
        width: 450px;
        padding-left: 60px;
        float: left;   
        margin-left: 60px;
    }
    #guym
    {
        color: Red;
        font-weight: bold;
        font-family: Sans-serif;
        font-size: 1.9em;
    }
    #P1
    {
        font-size: 1.4em;
    }
    #h1text
    {
        font-family: Sans-Serif; 
        margin: 10px; 
        padding-top: 20px;
        font-size: 3em;
        text-align: center;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="header"><img src="header_photo.png" alt="master shake" /></div>
     <!--NAVIGATION STARTS HERE -->
        <nav>
            <ul>
                <li><a href="default.aspx">Home</a></li>
                <li><a href="Buy.aspx">Buy</a></li>
                <li><a href="game.aspx">Where's Shake?</a></li>
                <li><a href="contact.aspx">Contact</a></li>
                <li><a href="aboutus.aspx">About Us</a></li>
            </ul>
        </nav>
    <!-- NAVIGATION ENDS HERE -->
    <div class="maincontent">
           
                <asp:Literal ID="CartBody" runat="server" />
                        <asp:GridView ID="ProductsGrid" runat="server" 
                                      AutoGenerateColumns="false" ShowHeader="true">
                            <Columns>
                                <asp:BoundField DataField="productID" HeaderText="Product ID" />
                                <asp:BoundField DataField="productName" HeaderText="Product Name" />
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="QuantityTextBox" Width="15px" Text='<%# Eval("Quantity") %>' runat="server" />
                                        <asp:Button ID="QuantityUpdate" Text="Update" CommandName="OnButtonModifyQantity" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' runat="server" />
                                        <asp:Button ID="QuantityRemove" Text="Remove" CommandName="OnButtonRemoveItem" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Price" DataFormatString="{0:c2}" HeaderText="Price Each" />
                                <asp:BoundField DataField="Total" DataFormatString="{0:c2}" HeaderText="Total Price" />
                            </Columns>
                        </asp:GridView>
               <asp:Literal ID="CartTotal" runat="server" />
             

    </div>
                   <footer>
                    <p>&copy; Datt Man Products, LLC</p>
                    <p>Datt Man Products, LLC is not responsible for whatever opinions and remarks come from this website.</p>
                </footer>  
   
    </form>
</body>
</html>

