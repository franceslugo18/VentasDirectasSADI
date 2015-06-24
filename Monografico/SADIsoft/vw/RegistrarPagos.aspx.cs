
﻿using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class RegistrarPagos : System.Web.UI.Page
    {
        protected List<int> facturas;
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = "";
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Contrato con = new Contrato();

                con = RealizarPagoControlador.BuscarContratoPorCedula(txtCedula.Text);

                TextNombre.Text = con.Cliente.Nombre + " " + con.Cliente.Apellido;
                //txtNoContrato.Text = con.ContratoId.ToString();
                TextDiaPago.Text = con.DiaPago.ToString();
                TextMensualidad.Text = con.Inmueble.PrecioAlquiler.ToString();

                List<int> lista = RealizarPagoControlador.CargarContratosIds(txtCedula.Text);
                DropDownList1.DataSource = lista;
                DropDownList1.DataBind();
                //ListItem item = new ListItem("--Seleccione---");
                //DropDownList1.Items.Insert(0,item);

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        DataView dv = new DataView();
        DataSet ds = new DataSet();

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           /*
            ds = RealizarPagoControlador.BuscarFacturasContrato(txtCedula.Text);
            dv.Table = ds.Tables["Facturas"];
            dv.RowFilter = string.Format("ContratoId = {0}", Convert.ToInt32(DropDownList1.SelectedValue));
            GridView1.DataSource = dv.ToTable();
            GridView1.DataBind();
            */
            GridView1.Enabled = true;
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
                    {
                        suma += Convert.ToDouble(row.Cells[3].Text);

                    }
                }
            }
            GridView1.FooterRow.Cells[2].Text = "Total";
            GridView1.FooterRow.Cells[3].Text = Convert.ToString(suma);

        }

        

        public List<int> Facturas
        {
            get
            {
                return facturas;
            }
        }

        public void PagarFacturas()
        {


            facturas = new List<int>();


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

            if (facturas.Capacity != 0)
            {
                
               Server.Transfer("/vw/CrearFactura.aspx");
            }
            else
            {
                Label1.Text = "* Debe seleccionar por lo menos una factura";
            }

        }

        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            PagarFacturas();

        }

        protected void Checked_change(object sender, EventArgs e)
        {
            SumarFacturasSeleccionadas();
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {

        }

        

    }
}
