using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class AdministracionProp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["PropietarioNombre"].ToString();
           

            ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost/Reportserver");

            

        }

        protected void ddlReportes_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string reporte = ddlReportes.SelectedValue.ToString();
            ReportViewer1.ServerReport.ReportPath = string.Format(@"/InmobiliariaReport/{0}", reporte);
            ReportViewer1.ServerReport.Refresh();

            ReportParameter PropietarioId = new ReportParameter();
            PropietarioId.Name = "PropietarioId";
            PropietarioId.Values.Add(Session["PropietarioId"].ToString());
            // Set the report parameters for the report
            ReportViewer1.ServerReport.SetParameters(
                new ReportParameter[] { PropietarioId });
        }
    }
}