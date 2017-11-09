using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CLIPSNET;
using TPIA.data;

namespace TPIA
{
    public partial class Principal : Form
    {
        private CLIPSNET.Environment clips;

        public Principal()
        {
            InitializeComponent();

            setearDefaults();
        }

        private void setearDefaults()
        {
            Edad.Text = Convert.ToString(18);
            Dinero.Text = Convert.ToString(0);
            Acompaniantes.SelectedIndex = Acompaniantes.Items.IndexOf("No Se");
            Mes.SelectedIndex = Mes.Items.IndexOf("No Se");

        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }

        }

        private void textBox4_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }

        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void BAnalizar_Click(object sender, EventArgs e)
        {
            var edad = Edad.Text;
            var dinero = Dinero.Text;
            var acompaniantes = Acompaniantes.SelectedItem;
            var mes = Mes.SelectedItem;
            var actividades = "";

            foreach (var i in SubActividades.CheckedItems)
            {
                actividades += i.ToString() + " ";
            }

            if (mes == "No Se")
                mes = "NoSe";
            String evalStr = "";
            clips = new CLIPSNET.Environment();
            clips.Load("programa.clp");
            clips.Load("facts.clp");
            clips.Reset();

            //evalStr = "(assert (viajero (caso 1) (edad " + edad + ") (dinero " + dinero + ") (acompaniantes " + acompaniantes + ")))";
            //clips.Eval(evalStr);
            //evalStr = "(assert (mes_viaje (caso 1) (nombre " + mes + ")))";
            //clips.Eval(evalStr);
            evalStr = "(assert (subtipos (valores " + actividades + ")))";
            clips.Eval(evalStr);

            clips.Run();


            evalStr = "(find-all-facts ((?J resultado)) TRUE)";
            //FactAddressValue fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];
            //String s = fv.GetFactSlot("nombre").ToString();

            //String evalStr = "(find-all-facts ((?J diagnostico)) TRUE)";
            var resultados = new List<Resultado>();

            foreach (FactAddressValue fv in clips.Eval(evalStr) as MultifieldValue)
            {
                var res = new Resultado();
                res.nombre = fv.GetFactSlot("nombre").ToString();
                res.lat = fv.GetFactSlot("lat").ToString();
                res.lon = fv.GetFactSlot("lon").ToString();
                resultados.Add(res);
            }

            //System.Diagnostics.Process.Start(@"chrome.exe", "http://maps.google.com.ar");

            Caso c = new Caso()
            {
                dni = _dni,
                edad = Edad.Text,
                acompaniante = Acompaniantes.SelectedItem.ToString(),
                dinero = Dinero.Text,
                fecha = DateTime.Now.ToString(),
                mes = Mes.SelectedItem.ToString(),
                actividades = SubActividades.CheckedItems.Cast<string>().ToList(),
                resultados = resultados
            };

            lbResultados.Items.Clear();

            Utils.SubirRegistro(c);
            foreach(var r in resultados)
            {
                lbResultados.Items.Add(r.nombre);
            }
            
        }

        private void lbResultados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = "https://www.google.com/maps/search/?api=1&query=";
            url += ((ListBox)sender).SelectedItem.ToString();
            Mapa m = new Mapa(url);
            m.Show();
        }
    }
}
