using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_Project
{
    public partial class frmAdminChapterAdd : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        string bookId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
            }
        }

        
        private void load_data()
        {
            bookId = Request.QueryString["bookid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select Title from Book where BookID = " + bookId, con);
            con.Open();

            // set series title to page
            lblSeries.Text = (String) cmd.ExecuteScalar();        
            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("insert into Chapter values('"
                + bookId + "', '"
                + txtTitle.Text + "', '" + txtContent.Text + "',Null)", con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);
        }
    }
}