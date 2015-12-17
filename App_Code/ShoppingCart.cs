using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

[Serializable]
public class CartItem
{
    private int ID;
    private int Quan;

    public int ProductID {
        get { return ID; }
        set { ID = value; }
    }
    public int Quantity {
        get { return Quan; }
        set { Quan = value; }
    }

    public CartItem(int ID, int Quantity)
    {
        this.ID = ID;
        Quan = Quantity;
    }
}

[Serializable]
public class ShoppingCart
{
    private string DBName;
    private double total;
    private List<CartItem> CartItems;

    public double Total {
        get
        {
            ToTable();
            return total;
        }
    }

    public ShoppingCart(string DatabaseName)
    {
        DBName = DatabaseName;
        CartItems = new List<CartItem>();
    }

    public void addItem(int ProdID, int Quantity)
    {
        foreach (CartItem item in CartItems)
            if (item.ProductID == ProdID)
            {
                item.Quantity = Quantity;
                return;
            }

        CartItems.Add(new CartItem(ProdID, Quantity));
    }

    public void SetQuantity(int ProdID, int Quantity)
    {
        foreach (CartItem item in CartItems)
            if (item.ProductID == ProdID)
            {
                if (Quantity < 1)
                {
                    CartItems.Remove(item);
                    return;
                }
                item.Quantity = Quantity;
                return;
            }
    }

    public void RemoveItem(int ProductID)
    {
        foreach (CartItem item in CartItems)
            if (item.ProductID == ProductID)
            {
                CartItems.Remove(item);
                return;
            }
    }

    public DataTable ToTable()
    {
        total = 0;

        DataTable dt = new DataTable();

        dt.Columns.Add("ProductID", typeof(string));
        dt.Columns.Add("ProductName", typeof(string));
        dt.Columns.Add("Quantity", typeof(int));
        dt.Columns.Add("Price", typeof(string));
        dt.Columns.Add("Total", typeof(string));

        using (SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings[DBName].ConnectionString))
        {
            for (int i = 0; i < CartItems.Count; ++i)
            {
                string sql = "SELECT ProductID, ProductName, Price FROM Products WHERE ProductID = @ProductID;";

                using (SqlCommand prodCommand = new SqlCommand(sql, dbConnection))
                {
                    prodCommand.Parameters.Add(new SqlParameter("@ProductID", System.Data.SqlDbType.Int)).Value = CartItems[i].ProductID;

                    dbConnection.Open();

                    using (SqlDataReader prodRecords = prodCommand.ExecuteReader())
                    {
                        if (prodRecords.Read())
                        {
                            double price =  Convert.ToDouble(prodRecords["Price"]);

                            DataRow dr = dt.NewRow();

                            dr[0] = prodRecords["ProductID"].ToString();
                            dr[1] = prodRecords["ProductName"].ToString();
                            dr[2] = CartItems[i].Quantity;
                            dr[3] = String.Format("{0:c}", prodRecords["Price"]);
                            dr[4] = String.Format("{0:c}", price * CartItems[i].Quantity);

                            dt.Rows.Add(dr);

                            total = price * CartItems[i].Quantity;
                        }
                    }

                    dbConnection.Close();
                }
            }

            return dt;
        }
    }
}