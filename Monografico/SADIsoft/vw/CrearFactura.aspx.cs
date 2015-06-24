using Microsoft.Reporting.WebForms;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class CrearFactura : System.Web.UI.Page
    {
        int pagoId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (!IsPostBack)
                //pagoId = PreviousPage.PagoId;
            
           // Response.Write(pagoId);

            try
            {
                
                ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
                ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost/Reportserver");
                ReportViewer1.ServerReport.ReportPath = "/InmobiliariaReport/Pago";
                ReportViewer1.ServerReport.Refresh();

               // PasarParametro();
                


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            
              


            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportParameter PagoId = new ReportParameter();
            PagoId.Name = "PagoId";
            PagoId.Values.Add(Session["pagoId"].ToString());

            // Set the report parameters for the report
            ReportViewer1.ServerReport.SetParameters(
                new ReportParameter[] { PagoId });
        }

        public void PasarParametro()
        {
            ReportParameter PagoId = new ReportParameter();
            PagoId.Name = "PagoId";
            PagoId.Values.Add(Session["pagoId"].ToString());

            // Set the report parameters for the report
            ReportViewer1.ServerReport.SetParameters(
                new ReportParameter[] { PagoId });
        }
    }
}