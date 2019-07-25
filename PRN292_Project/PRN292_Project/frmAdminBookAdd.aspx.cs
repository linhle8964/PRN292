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
    public partial class frmAdminBookAdd : System.Web.UI.Page
    {
       // string categoryId = "";
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
            //SqlConnection con = new SqlConnection(connStr);
            //SqlDataAdapter da = new SqlDataAdapter("select * from Category", con);
            //DataTable tb = new DataTable();
            //da.Fill(tb);
            //GridView1.DataSource = tb;
            //GridView1.DataBind();
        }
       
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
          

   
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //Insert vao bang book
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("insert into Book values('"
                + txtTitle.Text + "', '"
                + txtSummary.Text + "', '" + txtAuthor.Text + "',Null)", con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            load_data();
            Response.Redirect("frmAdminBook.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("frmLogin.aspx");
        }
    }
}