﻿using System;
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

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Viết hàm add Category vào đây

            //Lấy button sử dụng event
            Button btn = (Button)sender;

            //Lấy hàng có chứa dữ liệu của nút đã bấm
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            // còn lại tự làm

        }

        protected void GridViewBookCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Viết hàm delete Category vào đây
        }

        protected void GridViewBookDetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Viết hàm update Book detail vào đây vào đây
        }
    }
}