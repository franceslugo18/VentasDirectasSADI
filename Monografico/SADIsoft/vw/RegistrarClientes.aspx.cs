using SADI.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.registrar_cliente
{
    public partial class RegistrarClientes : System.Web.UI.Page
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

        protected void btnRegistrarCliente_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = txtNombre1.Text;
                string apellido = txtApellido1.Text;
                string cedula = txtCedula1.Text;
                string tel1 = txtTelefonos1.Text;
                string tel2 = txtTelefonos2.Text;
                string email = txtEmail1.Text;

                RegistrarClienteControlador.RegistrarCliente(nombre, apellido, cedula, tel1, tel2, email);
            }
            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}