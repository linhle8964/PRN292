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
    public partial class frmUserHome : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select b.BookID,b.Title,cast(s.[Average Score] as decimal(10,2)) as 'Average Score' " +
"from Book b, ( " +
"select b.BookID, AVG(Score) as 'Average Score' " +
"from Book b full outer join VoteScore v " +
"on b.BookID = v.BookID " +
"group by b.BookID) s " +
"where b.BookID = s.BookID and b.Title like '%" + txtSearch.Text + "%' " +
"order by s.[Average Score] desc", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
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

        private void load_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select b.BookID,b.Title,cast(s.[Average Score] as decimal(10,2)) as 'Average Score' " +
"from Book b, ( " +
"select b.BookID, AVG(Score) as 'Average Score' "+
"from Book b full outer join VoteScore v " + 
"on b.BookID = v.BookID " +
"group by b.BookID) s " +
"where b.BookID = s.BookID " +
"order by s.[Average Score] desc", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            lblUsername.Text = Session["userid"].ToString();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        
    }
}