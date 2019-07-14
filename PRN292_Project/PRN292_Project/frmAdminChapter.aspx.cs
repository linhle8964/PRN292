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
    public partial class frmAdminChapter : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
            }
            
    }
        private void load_data()
        {
            // Lấy book id từ trang trước
            string bookID = Request.QueryString["id"];
            // Lưu book id vào 1 label để các hàm khác dễ lấy lại và sử dụng 
            lblBookID.Text = bookID;

            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select * from Chapter where BookID=" + bookID, con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridViewListChapter.DataSource = tb;
            GridViewListChapter.DataBind();

        }

    

        protected void btnAddChapter_Click(object sender, EventArgs e)
        {
            string bookID = lblBookID.Text;
            Response.Redirect("frmAdminChapterAdd.aspx?id="+bookID);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy chapter id
            
            string chapterID = gvr.Cells[0].Text; ;

            Response.Redirect("frmAdminChapterEdit.aspx?id=" + chapterID);
        }
    }
}