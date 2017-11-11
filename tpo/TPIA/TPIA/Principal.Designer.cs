using TPIA.data;

namespace TPIA
{
    partial class Principal
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        private Caso _ultimoCaso;
        private string _dni;

        public Principal(Caso o, string d)
        {
            InitializeComponent();
            _ultimoCaso = o;
            _dni = d;

            if (_ultimoCaso != null)
            {
                this.Edad.Text = _ultimoCaso.edad ?? "18";
                this.Acompaniantes.SelectedItem = _ultimoCaso.acompaniante ?? "No Se";
                this.Dinero.Text = _ultimoCaso.dinero ?? "0";
                this.Mes.SelectedItem = _ultimoCaso.mes ?? "No Se";


                for (int count = 0; count < this.SubActividades.Items.Count; count++)
                {
                    if (_ultimoCaso.actividades.Contains(this.SubActividades.Items[count].ToString()))
                    {
                        this.SubActividades.SetItemChecked(count, true);
                    }
                }

                if (_ultimoCaso.resultados != null && _ultimoCaso.resultados.Count > 0)
                {
                    foreach (var r in _ultimoCaso.resultados)
                    {

                        this.lbResultados.Items.Add(r.nombre);
                    }
                }

                this.lFecha.Text = _ultimoCaso.fecha.ToString();

            }
            this.lDni.Text = _dni;
        }

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.Dinero = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.SubActividades = new System.Windows.Forms.CheckedListBox();
            this.Edad = new System.Windows.Forms.TextBox();
            this.Acompaniantes = new System.Windows.Forms.ComboBox();
            this.Mes = new System.Windows.Forms.ComboBox();
            this.BAnalizar = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbResultados = new System.Windows.Forms.ListBox();
            this.lFecha = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.lDni = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(30, 123);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Edad";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(30, 171);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(117, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Acompañantes";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(30, 222);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(56, 20);
            this.label3.TabIndex = 2;
            this.label3.Text = "Dinero";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(30, 275);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(90, 20);
            this.label4.TabIndex = 3;
            this.label4.Text = "Actividades";
            // 
            // Dinero
            // 
            this.Dinero.Location = new System.Drawing.Point(202, 222);
            this.Dinero.Name = "Dinero";
            this.Dinero.Size = new System.Drawing.Size(226, 26);
            this.Dinero.TabIndex = 6;
            this.Dinero.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox3_KeyPress);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(30, 462);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(96, 20);
            this.label5.TabIndex = 8;
            this.label5.Text = "Mes de viaje";
            // 
            // SubActividades
            // 
            this.SubActividades.FormattingEnabled = true;
            this.SubActividades.Items.AddRange(new object[] {
            "Museos",
            "Lugares_Historicos",
            "Fotografia",
            "Conocer_Ciudad",
            "Gastronomia",
            "Acuaticas",
            "Treking",
            "Cabalgata",
            "Buceo",
            "Descanso",
            "Pesca",
            "Nocturna"});
            this.SubActividades.Location = new System.Drawing.Point(202, 275);
            this.SubActividades.Name = "SubActividades";
            this.SubActividades.Size = new System.Drawing.Size(226, 151);
            this.SubActividades.TabIndex = 11;
            // 
            // Edad
            // 
            this.Edad.Location = new System.Drawing.Point(202, 123);
            this.Edad.Name = "Edad";
            this.Edad.Size = new System.Drawing.Size(226, 26);
            this.Edad.TabIndex = 4;
            this.Edad.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox1_KeyPress);
            // 
            // Acompaniantes
            // 
            this.Acompaniantes.FormattingEnabled = true;
            this.Acompaniantes.Items.AddRange(new object[] {
            "No Se",
            "Solo",
            "Amigos",
            "Familia",
            "Pareja"});
            this.Acompaniantes.Location = new System.Drawing.Point(202, 171);
            this.Acompaniantes.Name = "Acompaniantes";
            this.Acompaniantes.Size = new System.Drawing.Size(226, 28);
            this.Acompaniantes.TabIndex = 13;
            // 
            // Mes
            // 
            this.Mes.FormattingEnabled = true;
            this.Mes.Items.AddRange(new object[] {
            "No Se",
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre"});
            this.Mes.Location = new System.Drawing.Point(202, 462);
            this.Mes.Name = "Mes";
            this.Mes.Size = new System.Drawing.Size(226, 28);
            this.Mes.TabIndex = 14;
            // 
            // BAnalizar
            // 
            this.BAnalizar.Location = new System.Drawing.Point(463, 438);
            this.BAnalizar.Name = "BAnalizar";
            this.BAnalizar.Size = new System.Drawing.Size(183, 52);
            this.BAnalizar.TabIndex = 15;
            this.BAnalizar.Text = "Analizar";
            this.BAnalizar.UseVisualStyleBackColor = true;
            this.BAnalizar.Click += new System.EventHandler(this.BAnalizar_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(12, 12);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(1020, 36);
            this.label6.TabIndex = 16;
            this.label6.Text = "Sistema Experto para Determinar Destinos Turisticos en Centroamérica";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.lbResultados);
            this.panel1.Controls.Add(this.lFecha);
            this.panel1.Controls.Add(this.label8);
            this.panel1.Controls.Add(this.label7);
            this.panel1.Location = new System.Drawing.Point(697, 78);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(374, 441);
            this.panel1.TabIndex = 17;
            // 
            // lbResultados
            // 
            this.lbResultados.FormattingEnabled = true;
            this.lbResultados.ItemHeight = 20;
            this.lbResultados.Location = new System.Drawing.Point(18, 45);
            this.lbResultados.Name = "lbResultados";
            this.lbResultados.Size = new System.Drawing.Size(341, 384);
            this.lbResultados.TabIndex = 3;
            this.lbResultados.SelectedIndexChanged += new System.EventHandler(this.lbResultados_SelectedIndexChanged);
            // 
            // lFecha
            // 
            this.lFecha.AutoSize = true;
            this.lFecha.Location = new System.Drawing.Point(225, 7);
            this.lFecha.Name = "lFecha";
            this.lFecha.Size = new System.Drawing.Size(114, 20);
            this.lFecha.TabIndex = 2;
            this.lFecha.Text = "--NO EXISTE--";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(123, 7);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(108, 20);
            this.label8.TabIndex = 1;
            this.label8.Text = "Fecha y Hora:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(5, 7);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(112, 20);
            this.label7.TabIndex = 0;
            this.label7.Text = "Ultimo Analisis";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(30, 68);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(41, 20);
            this.label9.TabIndex = 18;
            this.label9.Text = "DNI:";
            // 
            // lDni
            // 
            this.lDni.AutoSize = true;
            this.lDni.Location = new System.Drawing.Point(106, 68);
            this.lDni.Name = "lDni";
            this.lDni.Size = new System.Drawing.Size(19, 20);
            this.lDni.TabIndex = 19;
            this.lDni.Text = "--";
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1090, 531);
            this.Controls.Add(this.lDni);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.BAnalizar);
            this.Controls.Add(this.Mes);
            this.Controls.Add(this.Acompaniantes);
            this.Controls.Add(this.SubActividades);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.Dinero);
            this.Controls.Add(this.Edad);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Principal";
            this.Text = "Sistema Experto para determiar destinos turisticos";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox Edad;
        private System.Windows.Forms.TextBox Dinero;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.CheckedListBox SubActividades;
        private System.Windows.Forms.ComboBox Acompaniantes;
        private System.Windows.Forms.ComboBox Mes;
        private System.Windows.Forms.Button BAnalizar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lFecha;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ListBox lbResultados;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label lDni;
    }
}

