﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIniciarSeccionA_Click(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(GetType(),"Mi Prueba","alert('Prueba Carlos')",true);
            Response.Redirect("/Login.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            


        }
    }
}