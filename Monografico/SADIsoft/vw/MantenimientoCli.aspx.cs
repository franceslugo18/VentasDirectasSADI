using SADI.Controller;
using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class MantenimientoCli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) == 3)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }
        }
        int idCliente = 0;

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                idCliente = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                //txtTelefonops1.Text = idPropietario.ToString();
                btnRegistrar.Enabled = false;
                btnActualizarCl.Enabled = true;
                btnEliminar.Enabled = true;


                Cliente clie = MantenimientoClienteControlador.BuscarPorId(idCliente);

                txtNombre1.Text = clie.Nombre;
                txtApellido1.Text = clie.Apellido;
                txtCedula1.Text = clie.Cedula;
                txtTelefonops1.Text = clie.Tel1;
                TxtTelefonops2.Text = clie.Tel2;
                TextEmail.Text = clie.Email;
                

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnActualizarCl_Click(object sender, EventArgs e)
        {
            
            MantenimientoClienteControlador.ActualizarCliente(idCliente, txtNombre1.Text, txtApellido1.Text, txtCedula1.Text, txtTelefonops1.Text, TxtTelefonops2.Text, TextEmail.Text);
            GridView1.DataBind();
        }

   



        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            idCliente = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            if (MantenimientoClienteControlador.EliminarCliente(idCliente) == 1)
                Response.Write("El cliente ha sido eliminado");
            else
                Response.Write("El cliente no puede ser eliminado. Revise que el cliente no este en un contrato activo");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre1.Text;
                string apellido = txtApellido1.Text;
                string cedula = txtCedula1.Text;
                string tel1 = txtTelefonops1.Text;
                string tel2 = TxtTelefonops2.Text;
                string email = TextEmail.Text;

                RegistrarClienteControlador.RegistrarCliente(nombre, apellido, cedula, tel1, tel2, email);
                Response.Redirect("/vw/RegistroCCorrectamente.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            btnRegistrar.Enabled = true;
            btnActualizarCl.Enabled = false;
            btnEliminar.Enabled = false;

            GridView1.SelectedIndex = -1;

            txtNombre1.Text = "";
            txtApellido1.Text = "";
            txtCedula1.Text = "";
            txtTelefonops1.Text = "";
            TxtTelefonops2.Text = "";
            TextEmail.Text = "";
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridView1.PageIndex = e.NewSelectedIndex;
            GridView1.DataBind();

        }
    }
}