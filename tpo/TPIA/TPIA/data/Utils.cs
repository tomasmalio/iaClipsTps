using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPIA.data
{
    static public class Utils
    {
        private const string FILENAME = @".\test.dat";
        static public void SubirRegistro(Caso c)
        {
            var objeto = JsonConvert.SerializeObject(c);
            using (StreamWriter w = File.AppendText(FILENAME))
            {
                w.WriteLine(objeto);
            }
        }

        static public List<Caso> RecuperarListaCasos()
        {
            var line = "";
            var casos = new List<Caso>();

            using (StreamReader r = new StreamReader(FILENAME))
            {
                while (!r.EndOfStream)
                {
                    line = r.ReadLine();
                    Caso c = JsonConvert.DeserializeObject<Caso>(line);
                    casos.Add(c);
                }
            }
            return casos;

        }

        static public Caso BuscarUltimoCaso(string dni)
        {
            var casos = RecuperarListaCasos();
            var aux = casos.Where(x => x.dni == dni).OrderByDescending(x=>x.fecha).ToList();
            return aux.FirstOrDefault();

        }
    }
}
