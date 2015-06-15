using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft
{
    public partial class VerDetallesInmueble : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
                con.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "USP_Detalle_Inmueble";
                com.Parameters.AddWithValue("@InmuebleId", Request.QueryString["Id"]);

                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                
                
                

                Image1.ImageUrl = "Images\\" + dr["Foto1"].ToString();
                Image2.ImageUrl = "Images\\" + dr["Foto2"].ToString();
                Image3.ImageUrl = "Images\\" + dr["Foto3"].ToString();
                Image4.ImageUrl = "Images\\" + dr["Foto4"].ToString();




                dr.Close();
                con.Close();
            }
            catch(Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }
    }
}