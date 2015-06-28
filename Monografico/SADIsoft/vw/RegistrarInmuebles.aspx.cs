using SADIsoft.Controller;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.registrar_inmueble
{
    public partial class RegistrarInmuebles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) == 3)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }
            if (!IsPostBack)
            {
                CargarPropietarios();
                CargarProvincias();
               
   
            }

            
            if (cbMarquesina1.Checked == true)
            {
                ddlCapacidadMarquesina1.Enabled = true;
            }

        }
        private void CargarPropietarios()
        {
            ddlPropietario1.DataSource = PropietarioDA.CargarPropietariosDB();
            ddlPropietario1.DataTextField = "Nombre";
            ddlPropietario1.DataValueField = "PropietarioId";
            ddlPropietario1.DataBind();
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

        protected void btnRegistrar1_Click(object sender, EventArgs e)
        {
            int propietarioId = Convert.ToInt32(ddlPropietario1.SelectedValue);
            int provinciaId = Convert.ToInt32(ddlProvincia1.SelectedValue);
            int municipioId = Convert.ToInt32(ddlMunicipio1.SelectedValue);
            int sectorId = Convert.ToInt32(ddlSector1.SelectedValue);
            string calle = txtCalle1.Text;
            string numero = txtNumero1.Text;
            bool tipo;
            
            decimal precioAlquiler = 0.0m;
            if (txtPrecioAlquiler1.Text != "")
            {
                precioAlquiler = Convert.ToDecimal(txtPrecioAlquiler1.Text);
            }
            int depositos = 0;
            if (ddlDepositos1.SelectedValue != "")
            {
                depositos = Convert.ToInt32(ddlDepositos1.SelectedValue);
            }

            
            int niveles = Convert.ToInt32(ddlNiveles1.SelectedValue);

            bool sotano = cbSotano1.Checked;
            bool piscina = cbPiscina1.Checked;
            bool marquesina = cbMarquesina1.Checked;
            int capacidad = 0;
            if (ddlCapacidadMarquesina1.SelectedIndex != -1)
            {
                capacidad = ddlCapacidadMarquesina1.SelectedIndex;
            }
            int habitaciones = Convert.ToInt32(ddlHabitaciones1.Text);
            int banos = Convert.ToInt32(ddlBanos1.Text);

            string nombreFoto1 = "1" + GenerarNumeroAleatorio(25) + ".jpg";
            string nombreFoto2 = "2" + GenerarNumeroAleatorio(25) + ".jpg";
            string nombreFoto3 = "3" + GenerarNumeroAleatorio(25) + ".jpg";
            string nombreFoto4 = "4" + GenerarNumeroAleatorio(25) + ".jpg";

            string comentarios = txtComentarios1.Text;

            bool tipoInmueble = false;
            

            try
            {
                int inmuebleId = RegistrarInmuebleControlador.RegistrarInmueble(propietarioId, provinciaId, municipioId, sectorId, calle, numero,
                    true, precioAlquiler, depositos, 0, niveles, tipoInmueble, sotano, piscina, marquesina, capacidad, comentarios,
                    nombreFoto1, nombreFoto2, nombreFoto3, nombreFoto4, habitaciones, banos);


                if (FileUpload1.HasFile)
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto1);
                }
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto2);
                FileUpload3.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto3);
                FileUpload4.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto4);
                

                Response.Redirect("/vw/RegistroIn.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            
        }

        private static string GenerarNumeroAleatorio(int PasswordLength)
        {
            string _allowedChars = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789";
            Byte[] randomBytes = new Byte[PasswordLength];
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;

            for (int i = 0; i < PasswordLength; i++)
            {
                Random randomObj = new Random();
                randomObj.NextBytes(randomBytes);
                chars[i] = _allowedChars[(int)randomBytes[i] % allowedCharCount];
            }

            return new string(chars);
        }

        protected void ddlMunicipio1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MunicipioId = Convert.ToInt32(ddlMunicipio1.SelectedValue);
            CargarSectores(MunicipioId);

        }

        protected void ddlPropietario1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlProvincia1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ProvinciaId = Convert.ToInt32(ddlProvincia1.SelectedValue);
            CargarMunicipios(ProvinciaId);
        }
     
    }
}