using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRN292_Project
{
    public partial class frmUserRead : System.Web.UI.Page
    {
        // tạo biến bookid để lưu lại bookid của chapter này
        string bookid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = Session["userid"].ToString();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Redirect tới chapter có cùng bookid và có chapterid lớn hơn và kế tiếp chapter này
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            // Redirect tới chapter có cùng bookid và có chapterid nhỏ hơn và kế tiếp chapter này
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Redirect về frmUserbook
            // Dùng bookid đã lưu ở trên
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