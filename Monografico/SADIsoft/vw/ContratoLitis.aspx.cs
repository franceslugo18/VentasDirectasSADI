using Microsoft.Reporting.WebForms;
using SADIsoft.Controller;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class ContratoLitis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (!IsPostBack)
            {
                CargarPropietarios();

            }

            try
            {

                ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost/Reportserver");
                ReportViewer1.ServerReport.ReportPath = "/InmobiliariaReport/Report1";
                ReportViewer1.ServerReport.Refresh();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

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
            //Session["Idinmueble"] = GridView1.SelectedDataKey.Value.ToString();
            //Response.Redirect("/vw/ContratoLitisGenerado.aspx");
            try
            {
                if (GridView1.SelectedIndex != -1)
                {
                    Label1.Visible = false;

                    GenerarContratoLitisControlador.guardarContrato(GridView1.SelectedDataKey.Value.ToString(), DateTime.Now);

                    ReportParameter InmuebleId = new ReportParameter();
                    InmuebleId.Name = "InmuebleId";
                    InmuebleId.Values.Add(GridView1.SelectedDataKey.Value.ToString());

                    Session["Idinmueble"] = GridView1.SelectedDataKey.Value.ToString();

                    // Set the report parameters for the report
                    ReportViewer1.ServerReport.SetParameters(
                        new ReportParameter[] { InmuebleId });
                }
                else
                {
                    Label1.Visible = true;
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            
        }

        protected void ddlPropietario1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            List<SADI.Model.Inmueble> ListaInmuebles = new List<SADI.Model.Inmueble>();
            GridView1.AutoGenerateColumns = false;
            GridView1.DataSource = GenerarContratoLitisControlador.BuscarInmueblesPropietario(ddlPropietario1.SelectedValue);

            */


        }
    }
}