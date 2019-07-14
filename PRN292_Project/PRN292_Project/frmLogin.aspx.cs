using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PRN292_Project
{
    public partial class frmLogin : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            

             SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("select * from Users where UserID = @username and Password = @word and Type = @role", con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@word", txtPass.Text);
            cmd.Parameters.AddWithValue("@role", DropDownList1.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                if(string.Compare(DropDownList1.SelectedValue,"Admin") == 0)
                {
                    Session["id"] = txtUsername.Text;
                    Response.Redirect("frmAdminBook.aspx");
                    Session.RemoveAll();
                }else
                {
                    Session["id"] = txtUsername.Text;
                    Response.Redirect("frmUserHome.aspx");
                    Session.RemoveAll();
                }
                
            }
            else
            {
                lblShow.Text = "Wrong input";
            }
        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmSignin.aspx");
        }
    }
}