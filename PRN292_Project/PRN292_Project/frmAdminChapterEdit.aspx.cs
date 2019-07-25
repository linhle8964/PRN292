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
    public partial class frmAdminChapterEdit : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        private static string chapterId, bookId;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                load_data();
                


            }
        }

        private void load_data()
        {
            chapterId = Request.QueryString["id"];
            lblChapterID.Text = chapterId;
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select Book.BookID, Book.Title, Chapter.Title, Chapter.Content " +
                "from Book, Chapter " +
                "where Book.BookID = Chapter.BookID and Chapter.ChapterID = @chapterID", con);
            
            //set chapter id to query string
            cmd.Parameters.Add("@chapterID", SqlDbType.Int);
            cmd.Parameters["@chapterID"].Value = Int32.Parse(chapterId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    bookId = reader.GetSqlInt32(0) + "";
                    lblSeries.Text = reader.GetString(1);
                    cTitle.Text = reader.GetString(2);
                    txtContent.Text = reader.GetString(3);
                    break;
                }
            }
            finally
            {
                reader.Close();
            }
            con.Close();
           
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            chapterId = Request.QueryString["id"];
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("update Chapter " +
                            "set Title = @title , Content = @content " +
                            "where ChapterID = @cid", con);

            //set title to query string
            cmd.Parameters.Add("@title", SqlDbType.Text);
            cmd.Parameters["@title"].Value = cTitle.Text;

            //set content to query string
            cmd.Parameters.Add("@content", SqlDbType.Text);
            cmd.Parameters["@content"].Value = txtContent.Text;

            //set chapter id to query string
            cmd.Parameters.Add("@cid", SqlDbType.Int);
            cmd.Parameters["@cid"].Value = Int32.Parse(lblChapterID.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            load_data();
            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            load_data();
            Response.Redirect("frmAdminChapter.aspx?bookid=" + bookId);

        }

      
    }
}