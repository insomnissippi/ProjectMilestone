﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Buy.aspx.cs" Inherits="_Default" %>

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
                <li><a href="">Buy</a></li>
                <li><a href="game.aspx">Where's Shake?</a></li>
                <li><a href="contact.aspx">Contact</a></li>
                <li><a href="aboutus.aspx">About Us</a></li>
            </ul>
        </nav>
    <!-- NAVIGATION ENDS HERE -->
    <div class="maincontent">
    
    <!-- <div id="products">
            <div id="ShakePhone">
                <img src="" height="280" width="280"/>
                <p>The Shake Phone $19.95 </p>
                <div id="ShakeForm"><form><p>Quantity:</p><input type="text" name="Quantity" style="width:40px;position:absolute;top:979px;left:564px;" />
                <input type="submit" name="submit" value="BUY" style="margin:5px;position:absolute;top:974px;left:608px;"/></form></div>
            </div>                
                
            <div id="ChessDragon">
                <img src="" height="280" width="280" />
                <p>The Chess Dragon $25.95</p>
                <form><p>Quantity:</p><input type="text" name="Quantity" style="width:40px;position:absolute;top:979px;left:864px;" />
                <input type="submit" name="submit" value="BUY" style="margin:5px;position:absolute;top:974px;left:908px;"/></form>
            </div>                
                
            <div id="Fourteen">
                <img src="" height="280" width="280"/>
                <p>The Number Fourteen $1,000.00</p>
                <form><p>Quantity:</p><input type="text" name="Quantity" style="width:40px;position:absolute;top:979px;left:1164px;" />
                <input type="submit" name="submit" value="BUY" style="margin:5px;position:absolute;top:974px;left:1208px;"/></form>
            </div>

    </div>
    -->
                    <div id="search">
                          <h1 id="h1text">ATHF</h1>
                          SEARCH: <asp:TextBox ID="searchTerm" runat="server" />
                          <asp:Button ID="searchBtn" runat="server"
                            Text="GO!" OnClick="searchBtn_OnClick" />
                            <br /> By Default this search will return all matches to your terms.
                          <br />
                          <asp:Label ID="statusL" runat="server" />
                          
                          <asp:GridView ID="ProductsGrid" runat="server" AutoGenerateColumns="false">
                               <Columns>
                                    <asp:BoundField DataField="productID" HeaderText="Product ID" />
                                    <asp:HyperLinkField DataTextField="productName" HeaderText="Product Name:" DataNavigateUrlFields="productID" DataNavigateUrlFormatString="productdetails.aspx?productID={0}" />
                                    <asp:BoundField DataField="productPrice" HeaderText="Product Price:" />
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

