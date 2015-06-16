
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="javascrip.aspx.cs" Inherits="SADIsoft.prueba.javascrip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">


        var username = '<%= Session["Usuario"] %>';
        alert(username);

        /*alert('Hola Mundo');

        var n = 2;
        var n1 = 4;
        resultado = n + n1;
        alert('Él resultado es:' + resultado);
        var dias = ["lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];
        alert('El dia es: ' + dias[3]);

        var numero = prompt("Introduce un número y se mostrará su factorial");
        var factorial = 1;
        for(var i =1; i<= numero;i++)
        {
            factorial *= i;
        }
        alert('El factorial es: ' + factorial);*/
    
        function ocultar()
        {
            //var a = document.getElementById('p').style.visibility = "hidden";
            var a = document.getElementById('p').style.display = "none";


        }
        function ver() {
            var a = document.getElementById('p').style.display = "inline";

        }
 
        function hola()
        {
            alert('Hola Mundo');
        }

        var pagina = "http://www.yahoo.com";
        function abri()
        {
            
            location.href = pagina
        }
        setTimeout("abri()", 10000);

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label id="p">Hola</label>
        <input id="b" type="button" value="Ocultar" onclick="ocultar();" />
        <input id="c" type="button" value="Ver" onclick="ver();" />

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <input id="Button2" type="button" value="Abrir"  onclick="abri();"/>
        
    </div>
        
    </form>
</body>
</html>
