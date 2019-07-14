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
    public partial class frmAdminBook : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        private void load_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select * from Book", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            lblUsername.Text = Session["userid"].ToString();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
        }

      

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            //Lấy button sử dụng event
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy book id
            string bookid = gvr.Cells[0].Text;
            Response.Redirect("frmAdminChapter.aspx?id="+bookid);
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {

            Response.Redirect("frmAdminBookAdd.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //Lấy button sử dụng event
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            //lấy book id
            string bookid = gvr.Cells[0].Text;
            // forward sang trang edit cùng với book id(đã lấy ở trên) đi kèm
            Response.Redirect("frmAdminBookEdit.aspx?id=" + bookid);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }
    }
}