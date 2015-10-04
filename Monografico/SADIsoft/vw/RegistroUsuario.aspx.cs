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
                string email = TextEmail.Text;
                int tipo = 2;

                if (rbUsu.Checked == false)
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
                                               CASE (Tipo) WHEN 1 THEN 'Administrador' WHEN 2 THEN 'Usuario' WHEN 3 THEN 'Propietario' END Categoria,NombreUsuario
                                               FROM Usuarios WHERE UsuarioId = {0}", usuarioId);
                SqlCommand com = new SqlCommand(query,con);
                SqlDataReader dr = com.ExecuteReader();

                while (dr.Read())
                {
                    txtcategoria.Text= dr[0].ToString();
                    txtestado.Text = dr[1].ToString();
                    TextEmail.Text = dr[2].ToString();
                }
                btnActualizar.Enabled = true;
                btnRegistrar.Enabled = false;
                btnEliminar.Enabled = true;
                laEstado.Visible = true;
                txtcategoria.Visible = true;
                rbAd.Visible = false;
                rbUsu.Visible = false;
                laTipo.Visible = false;
                laCategoria.Visible = true;
                txtestado.Visible = true;
                r1.Visible = true;
                r2.Visible = true;
                c1.Visible = true;
                c2.Visible = true;
                c1.Checked = false;
                r1.Checked = false;
                r2.Checked = false;
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                Response.Write(GridView1.SelectedDataKey.ToString());
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            btnRegistrar.Enabled = true;
            btnActualizar.Enabled = false;
            btnEliminar.Enabled = false;
            laTipo.Visible = true;
            rbAd.Visible = true;
            rbUsu.Visible = true;

            GridView1.SelectedIndex = -1;

            TextEmail.Text = "";
            txtcategoria.Text = "";
            txtestado.Text = "";
            laEstado.Visible = false;
            txtcategoria.Visible = false;
            laCategoria.Visible = false;
            txtestado.Visible = false;
            r1.Visible = false;
            r2.Visible = false;
            c1.Visible = false;
            c2.Visible = false;

            
            
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                char a;
                int t;

                if (c1.Checked == true)
                {
                    a = '1';
                }
                else 
                {
                    a ='0';
                }
                if (r1.Checked == true)
                {
                    t = 2;
                }
                else 
                {
                    t = 1;
                }
                
                int usuarioId = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
                con.Open();
                string query = string.Format(@"UPDATE Usuarios SET Tipo = {0}, Estado = {1} WHERE UsuarioId = {2}", t, a, usuarioId);
                SqlCommand com = new SqlCommand(query, con);
                TextEmail.Text = "";
                txtcategoria.Text = "";
                txtestado.Text = "";
                r1.Checked = false;
                r2.Checked = false;
                c1.Checked = false;
                c2.Checked = false;
                com.ExecuteScalar();
                GridView1.DataBind();

                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        
    }
}