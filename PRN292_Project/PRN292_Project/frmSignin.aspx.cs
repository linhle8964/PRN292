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
    public partial class frmSignin : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connStr);
            try { 
            SqlCommand cmd = new SqlCommand("Insert into Users values('" +
                 txtUsername.Text + "','" + txtPassword.Text + "','" + txtEmail.Text +
                 "','" + txtAddress.Text + "','" + txtPhone.Text + "','User',NULL)", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("frmLogin.aspx");
            }
            catch(Exception ex)
            {
                lblError.Text = "Wrong Input";

            }

            
        }
    }
}