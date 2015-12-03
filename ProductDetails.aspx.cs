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
    protected void Page_Load(object sender, EventArgs e)
    {
        int productID;

        if (int.TryParse(Request.QueryString["productID"], out productID))
        {
            try
            {
                string retString = "Select productID, productName, productPrice, prodDescription from products where productID = @productID;";

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
                }
            }
            catch (Exception) { Response.Write("NO"); }
        }
        else
        {
            statusL.Text = "There are no products you dingus";
        }
    }
}
