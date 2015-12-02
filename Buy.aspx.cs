using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateDatagrid();
        }
    }
    protected void searchBtn_OnClick(object sender, EventArgs e)
    {
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["productsGrid"].ConnectionString;
            statusL.Text = "Searching for " + searchTerm.Text;
            string sqlQuery = "SELECT  productID, productName, productPrice FROM dbo.products where 1=2";
            string[] searchTerms = searchTerm.Text.Replace(';', ' ').Replace("'", "").Split(' ');
            foreach (string term in searchTerms)
            {
                sqlQuery += " OR productID like '%" + term + "%' OR productName like '%" + term + "%' OR productPrice like '%" + term + "%' ;"; 
            }
            SqlDataAdapter productHistory = new SqlDataAdapter(sqlQuery, connectionString);
            // Create and fill a DataSet.
            DataSet maailmanloppu = new DataSet();
            productHistory.Fill(maailmanloppu);
            DataView source = new DataView(maailmanloppu.Tables[0]);
            ProductsGrid.DataSource = source;
            ProductsGrid.DataBind();
        }
        catch (Exception exc)
        {
            statusL.Text = exc.Message;
        }
    }
    public void PopulateDatagrid()
    {
        try
        {
            SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["productsGrid"].ConnectionString);
            dbConnection.Open();
            dbConnection.ChangeDatabase("productsGrid");
            string retString = "Select productID as ProductID, productName as Name, productPrice as Price from products order by productID";
            SqlDataAdapter productHistory = new SqlDataAdapter(retString, dbConnection);
            DataSet maailmanloppu = new DataSet();
            productHistory.Fill(maailmanloppu);
            DataView source = new DataView(maailmanloppu.Tables[0]);
            ProductsGrid.DataSource = source;
            ProductsGrid.DataBind();
            dbConnection.Close();
        }
        catch (Exception) { Response.Write("NO"); }
    }
    protected void valuesAdd(int ProductID, string ProductName, double ProductPrice)
    {
        try
        {
            SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["productsGrid"].ConnectionString);
            string sql = "Insert into products (ProductID, Name, Price) VALUES (@productID, @productName, @productPrice);";
            SqlCommand command = new SqlCommand(sql, dbConnection);
            command.Parameters.Add(new SqlParameter("@productID", System.Data.SqlDbType.Int));
            command.Parameters["@productID"].Value = ProductID;
            command.Parameters.Add(new SqlParameter("@productName", System.Data.SqlDbType.VarChar));
            command.Parameters["@productName"].Value = ProductName;
            command.Parameters.Add(new SqlParameter("@productPrice", System.Data.SqlDbType.Money));
            command.Parameters["@productPrice"].Value = ProductPrice;
            dbConnection.Open();
            dbConnection.Close();
        }
        catch {Response.Write("NO");}
    }
}