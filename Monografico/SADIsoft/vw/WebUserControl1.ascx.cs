using SADIsoft.DataAccess;
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
    public partial class WebUserControl1 : System.Web.UI.UserControl
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

                
                CargarProvincias();
               

            }


        }

 
        private void CargarProvincias()
        {
            ddlProvincia1.DataSource = ProvinciaDA.CargarProvincias();
            ddlProvincia1.DataTextField = "Nombre";
            ddlProvincia1.DataValueField = "ProvinciaId";
            ddlProvincia1.DataBind();

            if (ddlProvincia1.Items.Count != 0)
            {
                int ProvinciaId = Convert.ToInt32(ddlProvincia1.SelectedValue);

                CargarMunicipios(ProvinciaId);
            }
            else
            {
                ddlMunicipio1.Items.Clear();
                ddlSector1.Items.Clear();
                //dvCustomer.DataSource = null;
                //dvCustomer.DataBind();
            }

        }
        private void CargarMunicipios(int ProvinciaId)
        {
            ddlMunicipio1.DataSource = MunicipioDA.CargarMunicipios(ProvinciaId);
            ddlMunicipio1.DataTextField = "Nombre";
            ddlMunicipio1.DataValueField = "MunicipioId";
            ddlMunicipio1.DataBind();


            if (ddlMunicipio1.Items.Count != 0)
            {
                int MunicipioId = Convert.ToInt32(ddlMunicipio1.SelectedValue);

                CargarSectores(MunicipioId);
            }
            else
            {
                ddlSector1.Items.Clear();
                //dvCustomer.DataSource = null;
                //dvCustomer.DataBind();
            }

        }
        private void CargarSectores(int MunicipioId)
        {
            ddlSector1.DataSource = SectorDA.CargarSectores(MunicipioId);
            ddlSector1.DataTextField = "Nombre";
            ddlSector1.DataValueField = "SectorId";
            ddlSector1.DataBind();

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
                precio.Text = Convert.ToDecimal((e.Row.DataItem as DataRowView).Row["PrecioAlquiler"]).ToString("#,###.00");
                e.Row.Cells[2].Controls.Add(precio);

                
                

            }
        }
        private void cargarGridView()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
            try
            {

                string provincia = ddlProvincia1.SelectedItem.ToString();
                string municipio = ddlMunicipio1.SelectedItem.ToString();
                string sector = ddlSector1.SelectedItem.ToString();
                double precio1 = 0;
                double precio2 = 0;
                if (txtPrecioDebajo.Text != "")
                {
                    precio1 = Convert.ToDouble(txtPrecioDebajo.Text);
                }
                if (txtPrecioDebajo0.Text != "")
                {
                    precio2 = Convert.ToDouble(txtPrecioDebajo0.Text);
                }

                bool tipo;
                if (RadioButton1.Checked == true)
                {
                    tipo = true;
                }
                else
                {
                    tipo = false;
                }

                con.Open();

                SqlCommand com = new SqlCommand();

                com.CommandText = string.Format(@"SELECT P.Nombre AS Provincia, I.Foto1, I.Observaciones, I.PrecioAlquiler, I.InmuebleId  FROM Inmuebles AS I

	                INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId

	                INNER JOIN Provincias AS P ON D.ProvinciaId = P.ProvinciaId

	                INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId

	                INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE (I.isDisponible = 1) AND ((@Provincia is null) OR (P.Nombre = @Provincia)) AND ((@Municipio is null) OR (M.Nombre = @Municipio)) AND ((@Sector is null) OR (S.Nombre = @Sector))
                                                          AND ((@Precio1 is null) OR (I.PrecioAlquiler >= @Precio1)) AND ((@Precio2 is null) OR (I.PrecioAlquiler <= @Precio2)) AND ((@Tipo is null) OR (TipoInmueble = @Tipo)) AND I.isEliminado = 0");
                com.CommandType = CommandType.Text;

                if (provincia == "-Seleccione-")
                {
                    com.Parameters.AddWithValue("@Provincia", DBNull.Value);
                    
                }
                else
                {
                    com.Parameters.AddWithValue("@Provincia", provincia);   
                }

                if (municipio == "-Seleccione-")
                {
                    com.Parameters.AddWithValue("@Municipio", DBNull.Value);
                    
                }
                else
                {
                    com.Parameters.AddWithValue("@Municipio", municipio);
                }
                if (sector == "-Seleccione-")
                {
                    com.Parameters.AddWithValue("@Sector", DBNull.Value);
                }
                else
                {
                    
                    com.Parameters.AddWithValue("@Sector", sector);
                }
                if (precio1 != 0)
                {
                    com.Parameters.AddWithValue("@Precio1", precio1.ToString());
                    
                }
                else
                {
                    com.Parameters.AddWithValue("@Precio1", DBNull.Value);
                    
                }
                if (precio2 != 0)
                {
                    com.Parameters.AddWithValue("@Precio2", precio2.ToString());

                }
                else
                {
                    com.Parameters.AddWithValue("@Precio2", DBNull.Value);

                }
                if (RadioButton1.Checked == true || RadioButton2.Checked == true)
                {
                    com.Parameters.AddWithValue("@Tipo", tipo);

                }
                else
                {
                    com.Parameters.AddWithValue("@Tipo", DBNull.Value);

                }

                com.Connection = con;

                SqlDataAdapter adap = new SqlDataAdapter(com);
                DataTable dta = new DataTable();

                adap.Fill(dta);
                
                GridView1.DataSource = dta;
                GridView1.DataBind();
                numero.Text = "Se Encontraron " + GridView1.Rows.Count.ToString() + " Inmuebles Segun su Criterio De Busqueda";

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            cargarGridView();
            slidePP.Visible = false;
        }

        protected void ddlProvincia1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ProvinciaId = Convert.ToInt32(ddlProvincia1.SelectedValue);
            CargarMunicipios(ProvinciaId);
        }

        protected void ddlMunicipio1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MunicipioId = Convert.ToInt32(ddlMunicipio1.SelectedValue);
            CargarSectores(MunicipioId);
        }

    }
}