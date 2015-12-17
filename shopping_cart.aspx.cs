using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shopping_cart : System.Web.UI.Page
{
   ShoppingCart Cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
                if (Cart == null)
                {
                    Cart = new ShoppingCart("ProductsGrid");
                    HttpContext.Current.Session["Cart"] = Cart;
                }

                ProductsGrid.DataSource = Cart.ToTable();
                ProductsGrid.DataBind();

                if (ProductsGrid.Rows.Count > 0)
                {
                    CartTotal.Text = "<p class='total'>Grand Total: "  String.Format("{0:c}", Cart.Total)  "</p>";
                }
                else
                {
                    CartBody.Text = "<p>Your cart is empty!</p>";
                }
            }
            catch (Exception ex)
            {
                CartBody.Text = "<p>Error: "  ex.Message  "</p>";
            }
        }
    }

    protected void ProductGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("OnButtonModifyQantity"))
        {
            int row = Convert.ToInt32(e.CommandArgument);
            
            TextBox quantxt;
            string prodtxt;
            int ProductID;
            int Quantity;

            quantxt = (TextBox)ProductsGrid.Rows[row].FindControl("QuantityTextBox");
            prodtxt = ProductsGrid.Rows[row].Cells[0].Text;

            if (int.TryParse(quantxt.Text, out Quantity) && int.TryParse(prodtxt, out ProductID))
            {
                Cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
                if (Cart == null)
                {
                    Cart = new ShoppingCart("ExoticAir");
                    HttpContext.Current.Session["Cart"] = Cart;
                }

                Cart.SetQuantity(ProductID, Quantity);
                HttpContext.Current.Session["Cart"] = Cart;
                Response.Redirect("cart.aspx");
            }
        }

        if (e.CommandName.Equals("OnButtonRemoveItem"))
        {
            int row = Convert.ToInt32(e.CommandArgument);

            string prodtxt;
            int ProductID;

            prodtxt = ProductsGrid.Rows[row].Cells[0].Text;

            if (int.TryParse(prodtxt, out ProductID))
            {
                Cart = HttpContext.Current.Session["Cart"] as ShoppingCart;
                if (Cart == null)
                {
                    Cart = new ShoppingCart("ExoticAir");
                    HttpContext.Current.Session["Cart"] = Cart;
                }

                Cart.RemoveItem(ProductID);
                HttpContext.Current.Session["Cart"] = Cart;
                Response.Redirect("cart.aspx");
            }
        }
    }
}