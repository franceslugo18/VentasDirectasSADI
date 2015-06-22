using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADI.Model
{
    public class Facturas
    {
        

        public Facturas()
        {

        }

        public Facturas(int facturaId, int numCuota, decimal mora, decimal totalCuota, DateTime fechaGenerada, Contrato contrato)
        {
            FacturaId = facturaId;
            NumCuota = numCuota;
            Mora = mora;
            TotalCuota = totalCuota;
            FechaGenerada = fechaGenerada;
            Contrato = contrato;

        }

        public Facturas(int facturaId, int numCuota, int contratoId, decimal mora, decimal totalCuota, DateTime fecha)
        {
            // TODO: Complete member initialization
            this.FacturaId = facturaId;
            this.NumCuota = numCuota;
            this.ContratoId = contratoId;
            this.Mora = mora;
            this.TotalCuota = totalCuota;
            this.FechaGenerada = fecha;
        }

        public int FacturaId { get; set; }
        public int NumCuota { get; set; }
        public decimal Mora { get; set; }
        public decimal TotalCuota { get; set; }
        public DateTime FechaGenerada { get; set; }
        public Contrato Contrato { get; set; }


        public int ContratoId { get; set; }
    }
}