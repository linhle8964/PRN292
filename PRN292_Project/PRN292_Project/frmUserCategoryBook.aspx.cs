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
    public partial class frmUserCategoryBook : System.Web.UI.Page
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
            string categoryid = Request.QueryString["categoryid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select b.BookID,b.Title,s.[Average Score],c.CategoryName " +
"from Book b, Book_Category bc, Category c, " +
"(select AVG(Score) as 'Average Score', BookID " +
"from VoteScore " +
"group by (BookID)) s " +
 "where b.BookID = s.BookID and b.BookID = bc.BookID and c.CategoryID = bc.CategoryID and c.CategoryID = '" + categoryid + "' "+
"order by s.[Average Score] desc", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            lblCategoryName.Text = tb.Rows[0]["CategoryName"].ToString();
        }


        protected void btnGo_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy book id
            string bookid = gvr.Cells[0].Text;
            Response.Redirect("frmUserBook.aspx?bookid=" + bookid);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUserHome.aspx");
        }
    }
}