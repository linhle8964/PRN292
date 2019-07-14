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
        string categoryId = "";
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

            da = new SqlDataAdapter("select b.BookID,c.CategoryID,c.CategoryName from Book b, Book_Category bc, Category c where b.BookID = bc.BookID and c.CategoryID = bc.CategoryID ", con);
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
        
        protected void GridViewCategoryList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            categoryId = GridViewCategoryList.Rows[e.NewSelectedIndex].Cells[1].Text;
            //luu category vao label
                Label11.Text = categoryId;
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Viết hàm add Category vào đây
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd1 = new SqlCommand("insert into Book_Category values('"
               + lblBookID.Text + "','"
                 + Label11.Text + "')", con);

            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            load_data();
            //Lấy button sử dụng event
           // Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            //GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            // còn lại tự làm

        }
        protected void GridViewBookCategory_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            categoryId = GridViewBookCategory.Rows[e.NewSelectedIndex].Cells[2].Text;
            //luu category vao label
            Label11.Text = categoryId;
        }
        protected void GridViewBookCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand("DELETE FROM Book_category WHERE BookID = @BookID and CategoryID=@categoryID"))
                {
                    command.Parameters.AddWithValue("@BookID", int.Parse(lblBookID.Text));
                    command.Parameters.AddWithValue("@categoryID", int.Parse(Label11.Text));
                    command.Connection = connection;
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
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
    }
}