using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class Administracion : System.Web.UI.Page
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

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string codigo = "18";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int ID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ContratoId"));
                HyperLink hyp = (HyperLink)e.Row.FindControl("hyp");
                hyp.NavigateUrl = "/vw/InquilinoDetalle.aspx?ContId=" + ID ;
            }
        }

        
    }
}