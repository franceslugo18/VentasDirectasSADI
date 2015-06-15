﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADI.Code
{
    public static class Validacion
    {
        public static bool ValidarCedula(string cedula, bool hasSymbols)
        {
            var cedulaParts = new string[3];
            var municipio = string.Empty;
            var digitoVerificador = string.Empty;

            if (hasSymbols)
            {
                if (cedula.Length < 13)
                {
                    return false;
                }
                else
                {
                    cedulaParts = cedula.Split(new char[] { '-' });
                    municipio = cedulaParts[0].Replace(" ", string.Empty) + cedulaParts[1].Replace(" ", string.Empty);
                    digitoVerificador = cedulaParts[2].Replace(" ", string.Empty);

                    try
                    {
                        Convert.ToInt32(digitoVerificador);
                    }
                    catch (FormatException)
                    {
                        return false;
                    }
                }
            }
            else
            {
                if (cedula.Length < 11)
                {
                    return false;
                }
                else
                {
                    cedulaParts[0] = cedula.Substring(0, 3);
                    cedulaParts[1] = cedula.Substring(3, 7);
                    cedulaParts[2] = cedula.Substring(10, 1);

                    municipio = cedulaParts[0] + cedulaParts[1];
                    digitoVerificador = cedulaParts[2];

                    try
                    {
                        Convert.ToInt32(digitoVerificador);
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
            }

            var suma = 0;

            for (int i = 0; i < municipio.Length; i++)
            {
                var mod = "";

                if ((i % 2) == 0)
                    mod = "1";
                else
                    mod = "2";

                var val = string.Empty;

                try
                {
                    var a = municipio.Substring(i, 1);
                    Convert.ToInt32(a);
                    val = a;
                }
                catch (Exception)
                {
                    return false;
                }

                var res = Convert.ToInt32(Convert.ToInt32(val) * Convert.ToInt32(mod));

                if (res > 9)
                {
                    var res1 = res.ToString();
                    var uno = res1.Substring(0, 1);
                    var dos = res1.Substring(1, 1);
                    res = Convert.ToInt32(uno) + Convert.ToInt32(dos);
                }

                suma += res;
            }

            var elNumero = (10 - (suma % 10) % 10);

            if (elNumero == Convert.ToInt32(digitoVerificador) && cedulaParts[0] != "000")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
