<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your home for stuff</title>
    <link rel="Stylesheet" type="text/css" href="css.css" />
    <style>
    #mainpara 
    {
        padding: 5px 10px;
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
                <li><a href="#">Home</a></li>
                <li><a href="contact.aspx">Contact</a></li>
                <li><a href="aboutus.aspx">About Us</a></li>
                <li><a href="Buy.aspx">Buy</a></li>
            </ul>
        </nav>
    <!-- NAVIGATION ENDS HERE -->
    <div class="maincontent">
                <p id="mainpara">We are in the business of giving you the business, and business is good. <br />
                We have only three products and they are in no way infringing on the copyrights you think are. 
                <br />Give us your money</p>
             </div> 
               <footer>
        <p>&copy; Datt Man Products, LLC</p>
        <p>Datt Man Products, LLC is not responsible for whatever opinions and remarks come from this website.</p>
    
    </footer>  
    </div>
    
   
    </form>
</body>
</html>
