using SADI.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft
{
    public partial class LoginCambioResp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("/LoginResponse.aspx");
            
        }

        protected void btnCambioContrase_Click(object sender, EventArgs e)
        {
            try
            {
                if (LoginControlador.CambiarContrasena(Session["Usuario"].ToString(), textContrase.Text)) Response.Write("Bien");
                Response.Redirect("/LoginResponse.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            
        }
    }
}