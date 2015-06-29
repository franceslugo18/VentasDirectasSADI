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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idCliente = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                //txtTelefonops1.Text = idPropietario.ToString();

                Cliente clie = mantenimientoClienteControlador.BuscarPorId(idCliente);

                txtTelefonops1.Text = clie.Tel1;
                TextEmail.Text = clie.Email;
                

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}