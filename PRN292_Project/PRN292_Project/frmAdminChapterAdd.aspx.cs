using System;
using System.Collections.Generic;
using System.Data;
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
        private static string bookId;

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
            bookId = Request.QueryString["bookid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("INSERT INTO Chapter (BookID, Title, Content) "
                             + "VALUES (@bookid, @title, @content)", con);
            
            //set BookID to query string
            cmd.Parameters.Add("@bookid", SqlDbType.Int);
            cmd.Parameters["@bookid"].Value = Int32.Parse(bookId);

            //set Title to query string
            cmd.Parameters.Add("@title", SqlDbType.Text);
            cmd.Parameters["@title"].Value = txtTitle.Text;

            //set Content to query string
            cmd.Parameters.Add("@content", SqlDbType.Text);
            cmd.Parameters["@content"].Value = txtContent.Text;


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            
            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            bookId = Request.QueryString["bookid"];
            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }
    }
}