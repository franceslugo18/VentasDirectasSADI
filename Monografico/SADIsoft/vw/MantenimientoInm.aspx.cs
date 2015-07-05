using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class MantenimientoInm : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idiInmueble = Convert.ToInt32(GridView1.SelectedDataKey.Value);
                Inmueble inm = MantenimientoInmuebleControlador.BuscarPorId(idiInmueble);
                txtPrecioAlquiler1.Text = inm.PrecioAlquiler.ToString();
                TextBox1.Text = inm.Depositos.ToString();
                TextBox2.Text = inm.Niveles.ToString();
                TextBox3.Text = inm.Habitaciones.ToString();
                TextBox4.Text = inm.Banos.ToString();
                txtComentarios1.Text = inm.Comentarios.ToString();
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                
            }
        }

        protected void btnRegistrar1_Click(object sender, EventArgs e)
        {
            

            int idInmueble = Convert.ToInt32(GridView1.SelectedDataKey.Value);

            Decimal precio = Convert.ToDecimal(txtPrecioAlquiler1.Text);
            int depositos = Convert.ToInt32(TextBox1.Text);
            int niveles = Convert.ToInt32(TextBox2.Text);
            int habitaciones = Convert.ToInt32(TextBox3.Text);
            int banios = Convert.ToInt32(TextBox4.Text);
            string comentario = txtComentarios1.Text;


            if (RadioButton1.Checked)
            {
                string nombreFoto1 = "1" + GenerarNumeroAleatorio(25) + ".jpg";
                string nombreFoto2 = "2" + GenerarNumeroAleatorio(25) + ".jpg";
                string nombreFoto3 = "3" + GenerarNumeroAleatorio(25) + ".jpg";
                string nombreFoto4 = "4" + GenerarNumeroAleatorio(25) + ".jpg";

                if (FileUpload1.HasFile)
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto1);
                }
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto2);
                FileUpload3.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto3);
                FileUpload4.PostedFile.SaveAs(Server.MapPath("~/Images/") + nombreFoto4);
                MantenimientoInmuebleControlador.ActualizarInmuble(precio, depositos, niveles, habitaciones, banios, comentario, idInmueble);
                MantenimientoInmuebleControlador.ActualizarFoto(nombreFoto1, nombreFoto2, nombreFoto3, nombreFoto4, idInmueble);
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "Mensaje();", true);

                GridView1.DataBind();
            }
            else
            {
                MantenimientoInmuebleControlador.ActualizarInmuble(precio, depositos, niveles, habitaciones, banios, comentario, idInmueble);
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "Mensaje();", true);
                GridView1.DataBind();
            }

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            FileUpload1.Visible = false;
            FileUpload2.Visible = false;
            FileUpload3.Visible = false;
            FileUpload4.Visible = false;
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            FileUpload1.Visible = true;
            FileUpload2.Visible = true;
            FileUpload3.Visible = true;
            FileUpload4.Visible = true;

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
    }
}