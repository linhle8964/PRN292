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
    public partial class frmUserRead : System.Web.UI.Page
    {
        // tạo biến bookid để lưu lại bookid của chapter này
        static int bookid;

        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        
        static string chapterId;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = Session["userid"].ToString();
            load_data();
        }

        protected void load_data()
        {
            chapterId = Request.QueryString["chapterid"];

            SqlConnection con = new SqlConnection(connStr);

            // code block để load chapter title và content
            string sql = "select * from Chapter where ChapterID = @chapterid";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("@chapterid", SqlDbType.Int);
            cmd.Parameters["@chapterid"].Value = Int32.Parse(chapterId);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    Label2.Text = reader.GetString(2);
                    TextBox1.Text = reader.GetString(3);
                    bookid = reader.GetInt32(1);
                }
                reader.Close();
            }
            finally
            {
                con.Close();
            }

            // code block to get previous chapter id
            try
            {
                int prev = GetAdjacentChapter("-");
                btnPrevious.Visible = true;
            }
            catch (NullReferenceException)
            {
                btnPrevious.Visible = false;
            }

            // code block to get next chapter id
            try
            {
                int next = GetAdjacentChapter("+");
                btnNext.Visible = true;
            }
            catch (NullReferenceException)
            {
                btnNext.Visible = false;
            }
        }

        // Hàm để lấy chapter id, modifier '-' để lấy prev, '+' để lấy next
        protected int GetAdjacentChapter(string modifier)
        {
            SqlConnection con = new SqlConnection(connStr);
            string sql = "with r as " +
                         "(select *, ROW_NUMBER() OVER(order by title) as rownum " +
                         "from Chapter " +
                         "where BookID = @bookid) " +
                         "select ChapterID from r " +
                         "where rownum = ((select rownum from r where ChapterID = @chapterid ) " + modifier + " 1) ";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.Add("@bookid", SqlDbType.Int);
            cmd.Parameters["@bookid"].Value = bookid;

            cmd.Parameters.Add("@chapterid", SqlDbType.Int);
            cmd.Parameters["@chapterid"].Value = Int32.Parse(chapterId);

            con.Open();

            try
            {
                int i = (int)cmd.ExecuteScalar();
                return i;
            }
            catch (NullReferenceException ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Redirect tới chapter có cùng bookid và có chapterid lớn hơn và kế tiếp chapter này
            try
            {
                int next = GetAdjacentChapter("+");
                Response.Redirect("frmUserRead.aspx?chapterid=" + next);
            } catch (Exception)
            {

            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            // Redirect tới chapter có cùng bookid và có chapterid nhỏ hơn và kế tiếp chapter này
            try
            {
                int prev = GetAdjacentChapter("-");
                Response.Redirect("frmUserRead.aspx?chapterid=" + prev);
            }
            catch (Exception)
            {

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Redirect về frmUserbook
            // Dùng bookid đã lưu ở trên
            Response.Redirect("frmUserBook.aspx?bookid=" + bookid);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUserHome.aspx");
        }
    }
}