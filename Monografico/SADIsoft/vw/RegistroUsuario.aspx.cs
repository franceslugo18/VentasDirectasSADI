using SADI.Controller;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.registrar_usuario
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) != 1)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }
        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail1.Text;
                int tipo = 2;
                
                if (rbUsuario.Checked == false)
                {
                    tipo = 1;
                }

                if (RegistrarUsuariosControlador.RegistrarUsuario(email,tipo))
                {
                    Response.Write("Enviado");
                }
                else
                {
                    Response.Write("Error");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int usuarioId = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
                con.Open();
                string query = string.Format(@"SELECT
                                               CASE (Estado) WHEN 0 THEN 'Inactivo' WHEN 1 THEN 'Activo' END EstadoText,
                                               Estado FROM Usuarios WHERE UsuarioId = {0}",usuarioId);
                SqlCommand com = new SqlCommand(query,con);
                SqlDataReader dr = com.ExecuteReader();

                while (dr.Read())
                {
                    DropDownList1.DataTextField = dr[0].ToString();
                    DropDownList1.DataValueField = dr[1].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                Response.Write(GridView1.SelectedDataKey.ToString());
            }
        }
    }
}