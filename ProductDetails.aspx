<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Your home for stuff</title>
    <link rel="Stylesheet" type="text/css" href="css.css" />
    <style type="text/css">
    #mainpara 
    {
        padding: 5px 10px;
    }
    #products 
    {
        width: 900px;
        margin: 0 auto;
        padding:10px;
    }
    
    #ShakePhone
    {
        width:300px;
        float:left;
    }
    
    #ChessDragon
    {
        width:300px;
        float:left;
    }
    
    #Fourteen
    {
        width:300px;
        float:left;
    }
    #ShakeForm{}
    #search
    {
        width: 400px;
        height: 400px;
        margin: 0 auto;
    }
    #h1text
    {
        font-family: Sans-Serif;
        font-weight: bold;
        font-size: 4em;
        color: Red;
        text-align: center;
    }
    #prod
    {
        font-family: Sans-Serif;
        font-weight: bold;
        font-size: 25px;
        color: black;
        text-align: center;
        margin: 0 auto;
    }
    #searchBtn
    {
          outline: none;
          border-radius: 5px;
          width: 60px;
          background-color: blue;
          color: #ecf0f1;
          transition: background-color .3s;
          
    }
    #searchBtn:active:before {
      width: 120%;
      padding-top: 120%;
      transition: width .2s ease-out, padding-top .2s ease-out;
    }
    #searchBtn:hover, #searchBtn:focus {
  background-color: #27ae60;
}

#searchBtn > * {
  position: relative;
}

#searchBtn span {
  display: block;
  padding: 12px 24px;
}

#searchBtn:before {
  content: "";
  
  position: absolute;
  top: 50%;
  left: 50%;
  
  display: block;
  width: 0;
  padding-top: 0;
    
  border-radius: 100%;
  
  background-color: rgba(236, 240, 241, .3);
  
  -webkit-transform: translate(-50%, -50%);
  -moz-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  -o-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

/* Styles, not important */
*, *:before, *:after {
  box-sizing: border-box;
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
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Buy.aspx">Buy</a></li>
                <li><a href="game.aspx">Where's Shake?</a></li>
                <li><a href="contact.aspx">Contact</a></li>
                <li><a href="aboutus.aspx">About Us</a></li>
            </ul>
        </nav>
    <!-- NAVIGATION ENDS HERE -->
    <div class="maincontent">

                    <div id="search">
                          <h1 id="h1text">ATHF</h1>

                          <asp:Literal ID="PageTitle" runat="server" />
                          <asp:Label ID="statusL" runat="server" />
                          
  
                    <asp:GridView ID="ProductsGrid" runat="server" 
                        AutoGenerateColumns="false" ShowHeader="false" CellPadding="0" OnRowCommand="ProductGrid_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="productID" HeaderText="Product ID" />
                            <asp:HyperLinkField DataTextField="productName" HeaderText="Product Name:" DataNavigateUrlFields="productID" DataNavigateUrlFormatString="productdetails.aspx?productID={0}" />
                            <asp:BoundField DataField="productPrice" HeaderText="Product Price:" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:TextBox ID="QuantityTextBox" Width="20px" Text="1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField Text="Add to Cart" CommandName="OnButtonAddToCart" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
             </div>
             </div> 
    <footer>
        <p>&copy; Datt Man Products, LLC</p>
        <p>Datt Man Products, LLC is not responsible for whatever opinions and remarks come from this website.</p>
    </footer>  
    </div>
    
   
    </form>
</body>
</html>

