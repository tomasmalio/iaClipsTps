using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPIA
{
    public partial class Mapa2 : Form
    {
        WebBrowserTabPage currentPage;
        public Mapa2(string url)
        {
            InitializeComponent();
            WebBrowserTabPage page = new WebBrowserTabPage();
            page.browser.Navigate(url);
            tabControl1.TabPages.Add(page);
            currentPage = page;
            
        }

       
    }
}
