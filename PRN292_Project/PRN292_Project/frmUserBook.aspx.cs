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
            //Load Category
            Label10.Text = GetCategoryData();
            //********************************
            string bookID = Request.QueryString["bookid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlDataAdapter da = new SqlDataAdapter("select * from Chapter where BookID=" + bookID, con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridViewChapter.DataSource = tb;
            GridViewChapter.DataBind();

            //Load Book Infor

            SqlDataAdapter da1 = new SqlDataAdapter("select title, summary, author from book where BookID=" + bookID, con);
            DataTable tb1 = new DataTable();
            da1.Fill(tb1);
            Label1.Text = tb1.Rows[0][0].ToString();
            lblAuthor.Text = tb1.Rows[0][2].ToString();
            lblSummary.Text = tb1.Rows[0][1].ToString();

            //Load AVG Score
            SqlDataAdapter da2 = new SqlDataAdapter("select cast(AVG(Score) as decimal(10,2)) as 'Average Score' from VoteScore where BookID=" + bookID, con);
            DataTable tb2 = new DataTable();
            da2.Fill(tb2);
            lblScore.Text = tb2.Rows[0][0].ToString();

            //Load current score
            SqlDataAdapter da3 = new SqlDataAdapter("select score from VoteScore where BookID=" + bookID + " and userid='" + lblUsername.Text + "'", con);
            DataSet ds = new DataSet();
            da3.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (count == 1)
            {
                DataTable tb3 = new DataTable();
                da3.Fill(tb3);
                DropDownList1.SelectedValue = tb3.Rows[0][0].ToString();
            }
            //Load Comment            
            SqlDataAdapter da4 = new SqlDataAdapter("select * from Comment where BookID=" + bookID + " order by CommentID desc", con);
            DataTable tb4 = new DataTable();
            da4.Fill(tb4);
            GridViewComment.DataSource = tb4;
            GridViewComment.DataBind();

            //Load Chapter
            SqlDataAdapter da5 = new SqlDataAdapter("select * from Chapter where BookID=" + bookID, con);
            DataTable tb5 = new DataTable();
            da5.Fill(tb5);
            GridViewChapter.DataSource = tb5;
            GridViewChapter.DataBind();

        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            string bookID = Request.QueryString["bookid"];
            SqlDataAdapter da = new SqlDataAdapter("select voteid from VoteScore where BookID=" + bookID + " and userid='" + lblUsername.Text + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            if (count == 1)
            {
                DataTable tb3 = new DataTable();
                da.Fill(tb3);
                string voteid = tb3.Rows[0][0].ToString();
                //Update VOTE
                if (DropDownList1.SelectedIndex != 0)
                {
                    SqlCommand cmd = new SqlCommand("update votescore set userid='" + lblUsername.Text
                + "', bookid ='" + bookID
               + "', score='" + int.Parse(DropDownList1.SelectedValue) + "' where voteid='" + voteid + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    load_data();

                }
                //Delete Vote
                else
                {
                    SqlCommand cmd = new SqlCommand("delete from votescore where voteid=" + voteid, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    load_data();
                }
            }
            //Insert vote
            else if (count == 0)
            {
                SqlCommand cmd = new SqlCommand("insert into votescore values ('" + lblUsername.Text
                + "', '" + bookID
               + "', '" + int.Parse(DropDownList1.SelectedValue) + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                load_data();
            }
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
        protected string GetCategoryData()
        {
            string bookID = Request.QueryString["bookid"];
            String result = "";
            //Create SQL Connection to Server
            SqlConnection myConnection = new SqlConnection(connStr);
            //Try and connect to Server and Database

            try
            {
                SqlCommand myCommand = new SqlCommand("select CategoryName from  Category C INNER JOIN Book_Category B on C.CategoryID=B.CategoryID INNER JOIN BOOK A on B.BookID=A.BookID where A.BookID = '"+bookID+"'", myConnection);
                myConnection.Open();

                SqlDataReader reader = myCommand.ExecuteReader();
                List<string> str = new List<string>();
               // int i = 0;
                while (reader.Read())
                {
                    str.Add(reader.GetValue(0).ToString());
                }
                foreach (string item in str)
                {
                    result += item + ",";
                }
                reader.Close();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                myConnection.Close();
            }
            return result;
        }



        protected void GridViewComment_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string UserID = GridViewComment.Rows[e.RowIndex].Cells[1].Text;
            if (lblUsername.Text.Equals(UserID))
            {
                string CommentID = GridViewComment.Rows[e.RowIndex].Cells[0].Text;
                string UserID1 = GridViewComment.Rows[e.RowIndex].Cells[1].Text;
                string Content = (GridViewComment.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
                GridViewComment.Rows[e.RowIndex].Cells[3].Enabled = false;
                SqlConnection con = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("update Comment set Content='" + Content +
                     "' where UserID='" + UserID1 + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                GridViewComment.EditIndex = -1;
                load_data();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('YOU ARE NOT ALLOWED TO EDIT COMMENT TO OTHER USER ');", true);


            }
        }

        protected void GridViewComment_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewComment.EditIndex = e.NewEditIndex;
            load_data();
        }

        protected void GridViewComment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string UserID = GridViewComment.Rows[e.RowIndex].Cells[1].Text;
            if (lblUsername.Text.Equals(UserID))
            {
                string CommentID = GridViewComment.Rows[e.RowIndex].Cells[0].Text;


                SqlConnection con = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("Delete Comment Where CommentID='" + int.Parse(CommentID) +
               "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                load_data();
            }else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('YOU ARE NOT ALLOWED TO Delete COMMENT TO OTHER USER ');", true);
            }
        }

        protected void GridViewComment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewComment.EditIndex = -1;
            this.load_data();
        }

        protected void GridViewComment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewComment.PageIndex = e.NewPageIndex;
            load_data();
        }


        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            string bookID = Request.QueryString["bookid"];
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("insert into Comment values('"
               + lblUsername.Text + "','" + bookID + "', '"
                + TextBox1.Text + "')", con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            load_data();
            TextBox1.Text = "";
        }

        protected void GridViewComment_RowDataBound(object sender, GridViewRowEventArgs e)
        {


        }
    }
}
