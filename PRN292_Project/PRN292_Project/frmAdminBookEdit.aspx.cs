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
    public partial class frmAdminBookEdit : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("select * from Category", con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridViewCategoryList.DataSource = tb;
            GridViewCategoryList.DataBind();

            da = new SqlDataAdapter("select b.BookID,c.CategoryID,c.CategoryName from Book b, Book_Category bc, Category c where b.BookID = bc.BookID and c.CategoryID = bc.CategoryID and b.BookID = '" +bookID+ "'", con);
            tb = new DataTable();
            da.Fill(tb);
            GridViewBookCategory.DataSource = tb;
            GridViewBookCategory.DataBind();

            
            da = new SqlDataAdapter("select * from Book where BookID=" + bookID, con);
            tb = new DataTable();
            da.Fill(tb);
            GridViewBookDetail.DataSource = tb;
            GridViewBookDetail.DataBind();

        }
        
    
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Viết hàm add Category vào đây

            //Lấy button sử dụng event
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string categoryid = gvr.Cells[0].Text;
            // còn lại tự làm

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd1 = new SqlCommand("insert into Book_Category values('"
               + lblBookID.Text + "','"
                 + categoryid + "')", con);

            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            load_data();

        }
     


        protected void GridViewBookDetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Viết hàm update Book detail vào đây vào đây
            string bookID = GridViewBookDetail.Rows[e.RowIndex].Cells[0].Text;
            string title = (GridViewBookDetail.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;

            string summary = (GridViewBookDetail.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string author = (GridViewBookDetail.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("update Book set title='" + title
                 + "', summary ='" + summary
                + "', author='" + author + "' where bookID='" + bookID + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridViewBookDetail.EditIndex = -1;
            load_data();

        }
        protected void GridViewBookDetail_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewBookDetail.EditIndex = e.NewEditIndex;
            load_data();
        }

        protected void GridViewBookCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string categoryid = GridViewBookCategory.Rows[e.RowIndex].Cells[1].Text;

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand("DELETE FROM Book_category WHERE BookID = @BookID and CategoryID=@categoryID"))
                {
                    command.Parameters.AddWithValue("@BookID", int.Parse(lblBookID.Text));
                    command.Parameters.AddWithValue("@categoryID", int.Parse(categoryid));
                    command.Connection = connection;
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            load_data();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        protected void GridViewCategoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCategoryList.PageIndex = e.NewPageIndex;
            load_data();
        }

        protected void GridViewBookCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewBookCategory.PageIndex = e.NewPageIndex;
            load_data();
        }
    }
}