using SADI.Controller;
using SADI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.propietarios_registrados
{
    public partial class PropietariosReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) == 3)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }

            //GridView1.DataSource = MantenimientoPropietarioControlador.ListaPropietarios();
            //GridView1.DataBind();
        }

        public void limpiar()
        {
            GridView1.SelectedIndex = -1;

            txtNombreP.Text = "";
            txtApellidoP.Text = "";
            txtCedulaP.Text = "";
            txtTelefonops1.Text = "";
            txtTelefonos2.Text = "";
            txtDireccion.Text = "";
            TextEmail.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idPropietario = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                //txtTelefonops1.Text = idPropietario.ToString();

                Propietario prop = MantenimientoPropietarioControlador.BuscarPorId(idPropietario);

                txtNombreP.Text = prop.Nombre;
                txtApellidoP.Text = prop.Apellido;
                txtCedulaP.Text = prop.Cedula;
                txtTelefonops1.Text = prop.Telefono1;
                txtTelefonos2.Text = prop.Telefono2;
                TextEmail.Text = prop.Email;
                txtDireccion.Text = prop.Direccion;

                btnActualizarPropietario.Enabled = true;
                btnEliminarPropietario.Enabled = true;
                btnRegistrarPropietario.Enabled = false; 
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }


        protected void btnNuevoPropietario_Click(object sender, EventArgs e)
        {
            limpiar();
            btnRegistrarPropietario.Enabled = true;
            btnActualizarPropietario.Enabled = false;
            btnEliminarPropietario.Enabled = false;

            
        }

        protected void btnRegistrarPropietario_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreP.Text;
            string apellido = txtApellidoP.Text;
            string cedula = txtCedulaP.Text;
            string telefono1 = txtTelefonops1.Text;
            string telefono2 = txtTelefonos2.Text;
            string direccion = txtDireccion.Text;
            string email = TextEmail.Text;

            GridView1.SelectedIndex = -1;

            try
            {
                //if (Validacion.ValidarCedula(cedula, false))
                //{

                RegistrarPropietarioControlador.RegistrarPropietario(nombre, apellido, cedula, direccion, telefono1, telefono2, email);

                //Response.Write("Propietario registrado con exito");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Almacenado Correctamente !!')", true);
                Response.Redirect("/vw/PropiCorectamente.aspx");

                // }
                // else
                // {
                //     Label1.Visible = true;
                //  }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnActualizarPropietario_Click(object sender, EventArgs e)
        {

            try
            {
                int idPropietario = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                //txtTelefonops1.Text = idPropietario.ToString();
                //Label1.Text = TextEmail.Text;
                string s = MantenimientoPropietarioControlador.ActualizarPropietario(idPropietario, txtNombreP.Text, txtApellidoP.Text,txtCedulaP.Text, txtTelefonops1.Text, txtTelefonos2.Text, txtDireccion.Text, TextEmail.Text);
                //Response.Write(s.ToString());
                //GridView1.UpdateRow(Convert.ToInt32(GridView1.SelectedDataKey.Value), false);

                limpiar();
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }

        protected void btnEliminarPropietario_Click(object sender, EventArgs e)
        {
            int idPropietario = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            int resp = MantenimientoPropietarioControlador.EliminarPropietario(idPropietario);

            if (resp > 0)
                Response.Write("No se puede eliminar el propietario. Asegurese que este no tenga ningun inmueble con contrato activo");
            else
                Response.Write("Propietario y sus inmuebles han sido eliminados con exito");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridView1.PageIndex = e.NewSelectedIndex;
            GridView1.DataBind();
        }
    }
}