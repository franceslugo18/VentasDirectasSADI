using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class MantenimientoContratos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int ContratoId = Convert.ToInt32(GridView1.SelectedDataKey.Value);

            CancelarContratoAlquilerControlador.CancelarContrato(ContratoId);
        }
    }
}