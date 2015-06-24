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
        protected void Page_Load(object sender, EventArgs e)
        {
            List<int> fact = new List<int>();
            fact = PreviousPage.Facturas;

            string ids = "";

            foreach (int s in fact)
            {
                ids += s.ToString() + " ";
            }

            Response.Write(ids);

        }
    }
}