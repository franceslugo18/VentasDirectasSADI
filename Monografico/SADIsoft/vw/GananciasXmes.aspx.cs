using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class GananciasXmes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) == 3)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }

            try
            {
                ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost/Reportserver");
                ReportViewer1.ServerReport.ReportPath = "/InmobiliariaReport/GananciaPorPeriodo";
                ReportViewer1.ServerReport.Refresh();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


        protected void Button11_Click(object sender, EventArgs e)
        {
            ReportParameter Mes = new ReportParameter();
            Mes.Name = "mes";
            Mes.Values.Add("6");

            ReportParameter Anio = new ReportParameter();
            Anio.Name = "ano";
            Mes.Values.Add("2015");

            // Set the report parameters for the report
            ReportViewer1.ServerReport.SetParameters(
                new ReportParameter[] { Mes, Anio });
        }
    }
}