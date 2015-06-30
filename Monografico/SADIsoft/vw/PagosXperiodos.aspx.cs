using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class PagosXperiodos : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
 

            ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            ReportViewer1.ServerReport.ReportServerUrl = new System.Uri("http://localhost/Reportserver");
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string reporte = DropDownList1.SelectedValue.ToString();
            ReportViewer1.ServerReport.ReportPath = string.Format(@"/InmobiliariaReport/{0}", reporte);
            ReportViewer1.ServerReport.Refresh();
        }
    }
}