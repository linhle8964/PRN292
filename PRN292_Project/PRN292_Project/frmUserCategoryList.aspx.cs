using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace PRN292_Project
{
    public partial class frmUserCategoryList : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUsername.Text = Session["userid"].ToString();
                load_data();
            }
        }

        private void load_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select * from Category", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

        }



        protected void btnGo_Click(object sender, EventArgs e)
        {
            //Lấy button sử dụng event
            LinkButton btn = (LinkButton)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy book id
            string categoryid = gvr.Cells[0].Text;
            Response.Redirect("frmUserCategoryBook.aspx?categoryid=" + categoryid);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load_data();
        }

    }
}