using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProductDetails : System.Web.UI.Page
{
    int productID;
    ShoppingCart Cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
            if (Cart == null)
            {
                Cart = new ShoppingCart("ProductsGrid");
                HttpContext.Current.Session["Cart"] = Cart;
            }

            if (int.TryParse(Request.QueryString["productID"], out productID))
            {
                try
                {
                    string retString = "Select productID, productName, productPrice from products where productID = @productID;";

                    using (SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["productsGrid"].ConnectionString))
                    using (SqlCommand sqlCmd = new SqlCommand(retString, dbConnection))
                    {
                        sqlCmd.Parameters.Add(new SqlParameter("@productID", System.Data.SqlDbType.Int)).Value = productID;

                        dbConnection.Open();
                        dbConnection.ChangeDatabase("productsGrid");
                        SqlDataAdapter productHistory = new SqlDataAdapter(sqlCmd);
                        DataSet maailmanloppu = new DataSet();
                        productHistory.Fill(maailmanloppu);
                        DataView source = new DataView(maailmanloppu.Tables[0]);
                        ProductsGrid.DataSource = source;
                        ProductsGrid.DataBind();

                        PageTitle.Text = "<h1>" + maailmanloppu.Tables[0].Rows[0][1] + "</h1>";
                    }
                }
                catch (Exception exc)
                {
                    statusL.Text = exc.Message;
                }
            }
            else
            {
                statusL.Text = "Invalid Product ID";
            }
        }
    }

    protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("OnButtonAddToCart"))
        {
            TextBox txt = (TextBox)ProductsGrid.Rows[0].FindControl("QuantityTextBox");

            int Quantity;
            if (int.TryParse(txt.Text, out Quantity) && int.TryParse(Request.QueryString["productID"], out productID))
            {
                Cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
                if (Cart == null)
                {
                    Cart = new ShoppingCart("ProductsGrid");
                    HttpContext.Current.Session["Cart"] = Cart;
                }

                Cart.addItem(productID, Quantity);
                HttpContext.Current.Session["Cart"] = Cart;
                Response.Redirect("shopping_cart.aspx");
            }
        }
    }
}