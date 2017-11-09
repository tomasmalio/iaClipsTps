using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPIA.data;
using static TPIA.data.StructFile;

namespace TPIA
{
    public partial class Inicio : Form
    {
        public Inicio()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var DNI = dni.Text;
            //Caso caso = new Caso();
            //caso.dni = "29579554";
            //caso.edad = "35";
            //caso.acompaniante = "Pareja";
            //caso.dinero = "20000";
            //caso.mes = "Enero";
            //caso.actividades = new List<string>();
            //caso.actividades.Add("Culturales");
            //caso.actividades.Add("Fiesta");
            //caso.actividades.Add("Familiares");
            //caso.resultados = new List<Resultado>();
            //caso.resultados.Add(new Resultado()
            //{
            //    nombre = "Cancun",
            //    tipoactividades = new List<string>() { "Fiesta", "Familiares" },
            //    lat = "-15.2343243",
            //    lon = "-35.3254354"
            //});
            //caso.resultados.Add(new Resultado()
            //{
            //    nombre = "Mexico DC",
            //    tipoactividades = new List<string> { "Culturales", "Familiares" },
            //    lat = "-15.4543243",
            //    lon = "-35.6254354"
            //});


            var UltimoCaso = Utils.BuscarUltimoCaso(DNI);

          
            var principal = new Principal(UltimoCaso, DNI);
            principal.Show();

            

        }
    }
}
