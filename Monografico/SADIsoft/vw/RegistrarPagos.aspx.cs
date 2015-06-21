
﻿using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class RegistrarPagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GridView1.Enabled = false;
            }
            if (GridView1.Enabled == true)
            {
                SumarFacturasSeleccionadas();
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Contrato con = new Contrato();

                con = RealizarPagoControlador.BuscarContratoPorCedula(txtCedula.Text);

                TextNombre.Text = con.Cliente.Nombre + " " + con.Cliente.Apellido;
                txtNoContrato.Text = con.ContratoId.ToString();
                TextDiaPago.Text = con.DiaPago.ToString();
                TextMensualidad.Text = con.Inmueble.PrecioAlquiler.ToString();

                GridView1.Enabled = true;

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private void SumarFacturasSeleccionadas()
        {
            double suma = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {

                    CheckBox ch = (CheckBox)ControlExtensions.FindControlRecursive(row, "chkMarca");

                    if (ch.Checked == true)
                        suma += Convert.ToDouble(row.Cells[4].Text);
                }
            }
            GridView1.FooterRow.Cells[3].Text = "Total";
            GridView1.FooterRow.Cells[4].Text = Convert.ToString(suma);

        }

        private void PagarFacturas()
        {


            List<int> facturas = new List<int>();
            foreach (GridViewRow row in GridView1.Rows)
            {

                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox ch = (CheckBox)ControlExtensions.FindControlRecursive(row, "chkMarca");
                    if (ch.Checked == true)
                    {
                        facturas.Add(Convert.ToInt32(row.Cells[0].Text));

                    }
                }
            }

            RealizarPagoControlador.PagarFacturas(facturas);

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            PagarFacturas();
        }

    }
}
