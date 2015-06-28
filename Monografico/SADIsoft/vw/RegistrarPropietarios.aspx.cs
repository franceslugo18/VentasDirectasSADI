using SADI.Code;
using SADI.Controller;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.registrar_propietarios
{
    public partial class RegistrarPropietarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Usuario"] == null)
            {
                Response.Redirect("/LoginResponse.aspx");
            }
            
            if (Convert.ToInt32(Session["Tipo"]) == 3)
                Response.Redirect("/LoginResponse.aspx");



            


        }
        
        string cedula;


        protected void btnRegistrarPropietario_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreP.Text;
            string apellido = txtApellidoP.Text;


            cedula = txtCedulaP.Text;


            
            string direccion = txtDireccionP.Text;
            string telefono1 = txtTelefonos1P.Text;
            string telefono2 = txtTelefonos2P.Text;
            string email = txtEmail1P.Text;

            try
            {
                //if (Validacion.ValidarCedula(cedula, false))
                //{

                    RegistrarPropietarioControlador.RegistrarPropietario(nombre, apellido, cedula, direccion, telefono1, telefono2, email);
                    
                    Response.Write("Propietario registrado con exito");
                    Response.Redirect("/propietarios registrados/PropietariosReg.aspx");
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

    
    }
}