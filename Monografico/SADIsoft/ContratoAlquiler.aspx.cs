using Microsoft.Reporting.WebForms;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft
{
    public partial class ContratoAlquiler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
                CargarPropietarios();

            }
            try
            {

                ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://francisco-lugo/Reportserver_SQLEXPRESS");
                ReportViewer1.ServerReport.ReportPath = "/InmobiliariaReport/ContratoAlquiler";
                ReportViewer1.ServerReport.Refresh();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        private void CargarClientes()
        {
            ddlCliente1.DataSource = ClienteDA.CargarClientesDB();
            ddlCliente1.DataTextField = "Nombre";
            ddlCliente1.DataValueField = "ClienteID";
            ddlCliente1.DataBind();
        }

        private void CargarPropietarios()
        {
            ddlPropietario1.DataSource = PropietarioDA.CargarPropietariosDB();
            ddlPropietario1.DataTextField = "Nombre";
            ddlPropietario1.DataValueField = "PropietarioId";
            ddlPropietario1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int inmId = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                int cliId = Convert.ToInt32(ddlCliente1.SelectedValue);
                int diaP = Convert.ToInt32(TextBox1.Text);

                Controller.GenerarContratoAlquilerControlador.guardarContrato(inmId, cliId, diaP, DateTime.Now);

                ReportParameter InmuebleId = new ReportParameter();
                InmuebleId.Name = "InmuebleId";
                InmuebleId.Values.Add(inmId.ToString());

                ReportParameter ClienteId = new ReportParameter();
                ClienteId.Name = "ClienteId";
                ClienteId.Values.Add(cliId.ToString());

                ReportParameter DiaPago = new ReportParameter();
                DiaPago.Name = "DiaPago";
                DiaPago.Values.Add(diaP.ToString());

                // Set the report parameters for the report
                ReportViewer1.ServerReport.SetParameters(
                    new ReportParameter[] { InmuebleId, ClienteId, DiaPago });
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}