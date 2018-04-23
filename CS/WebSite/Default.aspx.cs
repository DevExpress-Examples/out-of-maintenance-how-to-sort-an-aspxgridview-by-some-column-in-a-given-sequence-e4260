using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    private DataTable citiesDataTable;

    protected void Page_Init(object sender, EventArgs e) {
        rptCities.DataSource = GetCitiesDataTable();
        rptCities.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack)
            gv.ExpandRow(1);
    }

    protected void gv_CustomColumnSort(object sender, CustomColumnSortEventArgs e) {
        int order1 = GetOrderValue(e.Value1.ToString());
        int order2 = GetOrderValue(e.Value2.ToString());
        e.Handled = order1 != order2;
        if(e.Handled)
            e.Result = order1 > order2 ? 1 : -1;
    }

    private int GetOrderValue(string value) {
        DataRow dr = citiesDataTable.AsEnumerable().Where(r => r.Field<string>("City").ToLower().Contains(value.ToLower())).First();
        return (int)dr["Order"];
    }

    private DataTable GetCitiesDataTable() {
        if(citiesDataTable == null) {
            citiesDataTable = (DataTable)Session["Cities"];
            if(citiesDataTable == null) {
                const string cmdText = "SELECT * FROM [Cities]";
                string connString = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
                using(OleDbConnection connection = new OleDbConnection(connString)) {
                    using(OleDbCommand command = new OleDbCommand(cmdText, connection)) {
                        using(OleDbDataAdapter adapter = new OleDbDataAdapter(command)) {
                            DataTable dt = new DataTable("Cities");
                            adapter.Fill(dt);
                            Session["Cities"] = citiesDataTable = dt;
                        }
                    }
                }
            }
        }
        return citiesDataTable;
    }
}