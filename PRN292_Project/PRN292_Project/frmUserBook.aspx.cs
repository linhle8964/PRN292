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
    public partial class frmUserBook : System.Web.UI.Page
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        private void load_data()
        {
            string bookID = Request.QueryString["bookid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select * from Chapter where BookID=" + bookID, con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridViewChapter.DataSource = tb;
            GridViewChapter.DataBind();

        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            //Button này chứa 3 function
            //    Nếu User chưa vote thì add vote
            //    Nếu User đã vote thì edit vote
            //    Nếu User chuyển về "Not Vote" thì delete vote
            //    Nên viết 3 funtion riêng ở ngoài rồi cho vào đây
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUserHome.aspx");
        }

        protected void btnRead_Click(object sender, EventArgs e)
        {
            //Lấy button sử dụng event
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy book id
            string chapterid = gvr.Cells[0].Text;
            Response.Redirect("frmUserRead.aspx?chapterid=" + chapterid);
        }
    }
}