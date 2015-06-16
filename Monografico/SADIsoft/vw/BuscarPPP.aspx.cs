using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.prueba
{
    public partial class BuscarPPP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                TemplateField tfield = new TemplateField();
                
                tfield = new TemplateField();
                tfield.HeaderText = "Imagen";
                GridView1.Columns.Add(tfield);
                
                tfield = new TemplateField();
                tfield.HeaderText = "Descripcion";
                GridView1.Columns.Add(tfield);

                tfield = new TemplateField();
                tfield.HeaderText = "Precio";
                GridView1.Columns.Add(tfield);

                cargarGridView();


            }
           
        }
        
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                ImageButton ima = new ImageButton();
                ima.ID = "ima";
                ima.Width = Unit.Pixel(70);
                ima.Height = Unit.Pixel(70);
                ima.ImageUrl = "/Images/" + (e.Row.DataItem as DataRowView).Row["Foto1"].ToString();
                ima.PostBackUrl = "/VerDetallesInmueble.aspx?Id=" + (e.Row.DataItem as DataRowView).Row["InmuebleId"].ToString();
                e.Row.Cells[0].Controls.Add(ima);

                HyperLink descripcion = new HyperLink();
                descripcion.ID = "descripcion";
                descripcion.Text = (e.Row.DataItem as DataRowView).Row["Observaciones"].ToString();
                descripcion.NavigateUrl = "/VerDetallesInmueble.aspx?Id=" + (e.Row.DataItem as DataRowView).Row["InmuebleId"].ToString();
                e.Row.Cells[1].Controls.Add(descripcion);

                Label precio = new Label();
                precio.ID = "precio";
                precio.Text = (e.Row.DataItem as DataRowView).Row["PrecioAlquiler"].ToString();
                e.Row.Cells[2].Controls.Add(precio);

                
            }
        }
        private void cargarGridView()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
            try
            {

                string tipo = null;
                string accion = null;

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

                SqlDataAdapter adap = new SqlDataAdapter(com);
                DataTable dta = new DataTable();

                adap.Fill(dta);
                GridView1.DataSource = dta;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        
    }
}