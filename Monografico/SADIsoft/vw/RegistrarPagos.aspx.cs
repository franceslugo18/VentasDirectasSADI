using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            string queryAplicarMora = string.Format("SELECT Contratos.ContratoId FROM Contratos INNER JOIN Facturas ON Contratos.ContratoId = Facturas.ContratoId WHERE DiaPago = datepart(d,dateadd(d, -5, '{0}')) AND Facturas.Estado = 0", "07-05-2015"/*DateTime.Now*/);
            string queryGenerarFactura = string.Format("SELECT ContratoId FROM Contratos WHERE DiaPago = {0}", 30/*DateTime.Now.Day*/);
            string queryActualizarContratos = string.Format("SELECT ContratoId FROM Contratos WHERE CONVERT(DATE,DATEADD(yy,1,Fecha)) = CONVERT(DATE,'{0}') AND isActivo = 1 AND ActualizarAutom = 1", "06-16-2016"/*DateTime.Now.Day*/);

            string spAplicarMoras = "SP_Aplicar_Moras";
            string spGenerarFactura = "SP_Generar_Factura";
            string spActualizarContratos = "SP_Actualizar_Contrato";

            EjecutarQuery(queryAplicarMora, spAplicarMoras);
            EjecutarQuery(queryGenerarFactura, spGenerarFactura);
            EjecutarQuery(queryActualizarContratos, spActualizarContratos);
            
        }

        private void EjecutarQuery(string query, string storeProcedure)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=FRANCISCO-LUGO\SQLEXPRESS;
                Initial Catalog=PostgradoDB; user=sa; Password=adonay");
            conn.Open();
            
            SqlCommand com = new SqlCommand(query, conn);

            SqlDataReader dr = com.ExecuteReader();

            List<object> lista = new List<object>();

            while (dr.Read())
            {
                lista.Add(dr["ContratoId"]);
            }
            dr.Close();

            com = new SqlCommand();
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = storeProcedure;

            foreach (object obj in lista)
            {
                com.Parameters.Add("@ContratoId", SqlDbType.Int).Value = obj.ToString();
                com.ExecuteNonQuery();
                com.Parameters.Clear();
            }

            conn.Close();
        }
        
    




    }
}