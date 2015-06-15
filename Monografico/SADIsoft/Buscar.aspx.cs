using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft
{
    public partial class Buscar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tipo = null;
            string accion = null;

            if (Request.Form["ddlTipo"] != "-Seleccione-")
                tipo = Request.Form["ddlTipo"].ToString();
            if (Request.Form["ddlAccion"] != "-Seleccione-")
                accion = Request.Form["ddlAccion"].ToString();

            Label1.Text = "HELLO" + tipo + "   " + accion;

            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
                con.Open();

                SqlCommand com = new SqlCommand();



                com.CommandText = "SELECT * FROM Inmuebles WHERE ((@Tipo is null) OR (Tipo = @Tipo)) AND ((@TipoInmueble is null) OR (TipoInmueble = @TipoInmueble))";
                com.CommandType = CommandType.Text;

                if (tipo != null)
                {
                    com.Parameters.AddWithValue("@Tipo", tipo);
                }
                else
                {
                    com.Parameters.AddWithValue("@Tipo", DBNull.Value);
                }

                if (accion != null)
                {
                    com.Parameters.AddWithValue("@TipoInmueble", accion);
                }
                else
                {
                    com.Parameters.AddWithValue("@TipoInmueble", DBNull.Value);
                } 

                com.Connection = con;

                SqlDataAdapter a = new SqlDataAdapter(com);
                DataTable dt = new DataTable();

                a.Fill(dt);

                if (dt.Rows.Count > 0)//VERIFICA SI EL DATATABLE TIENE O NO REGISTROS
                    ResPropiedad.Text = dt.Rows.Count.ToString("#,###;#,###;0");

                ///------------------------------------
                ///Creando las columnas de la tabla
                ///------------------------------------
                TableRow tblRow = new TableRow();

                int columnas = 3;
                for (int i = 0; i < columnas; i++)
                {
                    TableCell cell = new TableCell();
                    cell.Style.Add("font-weight", "bold"); //Permite agregar un style o css manualmente. En este caso esta poniendo el titulo negrita.
                    switch (i)
                    {
                        case 0:
                            cell.Controls.Add(new LiteralControl("Imagen"));
                            cell.Width = Unit.Pixel(200);
                            break;
                        case 1:
                            cell.Width = Unit.Pixel(200); //Especifica que la unidad del Ancho de la celda es Pixeles
                            cell.Controls.Add(new LiteralControl("Descripcion"));
                            break;
                        case 2:
                            cell.Width = Unit.Pixel(100);
                            cell.Controls.Add(new LiteralControl("Precio"));
                            break;

                    }
                    tblRow.Cells.Add(cell);
                }
                Table1.Rows.Add(tblRow); //Agrega la fila con sus cinco columnas a la tabla.

                ///Buscnado los datos en el Datatable para luego agregarlos a las cedlas como 
                ///se hizo anteriormente.
                foreach (DataRow row in dt.Rows)
                {
                    tblRow = new TableRow();
                    for (int i = 0; i <= 2; i++)
                    {
                        TableCell cell = new TableCell();
                        cell.VerticalAlign = VerticalAlign.Top;

                        switch (i)
                        {
                            case 0:

                                ImageButton imgB = new ImageButton();
                                imgB.Width = Unit.Pixel(70);
                                imgB.Height = Unit.Pixel(70);
                                imgB.ImageUrl = "Images\\" + row["Foto1"].ToString();
                                imgB.PostBackUrl = "./VerDetallesInmueble.aspx?Id=" + row["InmuebleId"].ToString();//envia el clic encima de la foto a la pagina ver carro aspx

                                cell.Controls.Add(imgB);
                                break;
                            case 1:
                                HyperLink hp = new HyperLink();
                                hp.Text = row["Observaciones"].ToString();
                                hp.NavigateUrl = "./VerDetallesInmueble.aspx?Id=" + row["InmuebleId"].ToString();
                                cell.Controls.Add(hp);
                                break;
                            case 2:
                                decimal precio = 0;
                                decimal.TryParse(row["PrecioAlquiler"].ToString(), out precio);
                                cell.Controls.Add(new LiteralControl(precio.ToString("#,###.00;#,###.00;0.00")));
                                break;
                        }
                        tblRow.Cells.Add(cell); //Agrega cada celda de manera in
                    }
                    Table1.Rows.Add(tblRow); //Agrega cada fila con sus celdas..
                }


            }
            catch (Exception ex)
            {
                Label1.Text += "\n\n\n\n" + tipo + accion + ex.ToString();
            }
        }
    }
}