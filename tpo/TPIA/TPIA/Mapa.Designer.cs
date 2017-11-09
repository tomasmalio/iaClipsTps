namespace TPIA
{
    partial class Mapa
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        public Mapa(string url)
        {
            InitializeComponent();
            
            wbMapa.Navigate(url);
        }

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.wbMapa = new System.Windows.Forms.WebBrowser();
            this.SuspendLayout();
            // 
            // wbMapa
            // 
            this.wbMapa.Dock = System.Windows.Forms.DockStyle.Fill;
            this.wbMapa.Location = new System.Drawing.Point(0, 0);
            this.wbMapa.MinimumSize = new System.Drawing.Size(20, 20);
            this.wbMapa.Name = "wbMapa";
            this.wbMapa.Size = new System.Drawing.Size(835, 426);
            this.wbMapa.TabIndex = 0;
            // 
            // Mapa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(835, 426);
            this.Controls.Add(this.wbMapa);
            this.Name = "Mapa";
            this.Text = "Mapa";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.WebBrowser wbMapa;
    }
}