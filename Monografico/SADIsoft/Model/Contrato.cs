using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADI.Model
{
    public class Contrato
    {
        
        public Contrato()
        {
        }

        public Contrato(int contratoId, int diaPago)
        {
            ContratoId = contratoId;
            DiaPago = diaPago;
        }

        public Contrato(int contratoId, DateTime fechaContrato, Inmueble inmueble, int diaPago)
        {
            ContratoId = contratoId;
            FechaContrato = fechaContrato;
            Inmueble = inmueble;
            DiaPago = diaPago;
        }

        public Contrato(string nombre, string apellido, int contratoId, int diaPago, decimal precioAlquiler)
        {
            // TODO: Complete member initialization
            Cliente = new Cliente();
            Inmueble = new Inmueble();

            Cliente.Nombre = nombre;
            Cliente.Apellido = apellido;
            ContratoId = contratoId;
            DiaPago = diaPago;
            Inmueble.PrecioAlquiler = precioAlquiler;
        }

        public int ContratoId { get; set; }
        public DateTime FechaContrato { get; set; }
        public Cliente Cliente { get; set; }
        public Inmueble Inmueble { get; set; }
        public int DiaPago { get; set; }
    }
}