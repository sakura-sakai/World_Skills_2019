﻿namespace Session2.GUI
{
    partial class fEMMUsername
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvEMM = new System.Windows.Forms.DataGridView();
            this.btn_SendEMR = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEMM)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(180, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Available Assets:";
            // 
            // dgvEMM
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvEMM.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvEMM.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvEMM.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEMM.Location = new System.Drawing.Point(12, 55);
            this.dgvEMM.Name = "dgvEMM";
            this.dgvEMM.RowTemplate.Height = 24;
            this.dgvEMM.Size = new System.Drawing.Size(1051, 538);
            this.dgvEMM.TabIndex = 1;
            this.dgvEMM.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvEMM_CellClick);
            // 
            // btn_SendEMR
            // 
            this.btn_SendEMR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_SendEMR.Location = new System.Drawing.Point(12, 616);
            this.btn_SendEMR.Name = "btn_SendEMR";
            this.btn_SendEMR.Size = new System.Drawing.Size(431, 42);
            this.btn_SendEMR.TabIndex = 2;
            this.btn_SendEMR.Text = "Send Emergency Mainternance Request\r\n";
            this.btn_SendEMR.UseVisualStyleBackColor = true;
            this.btn_SendEMR.Click += new System.EventHandler(this.btn_SendEMR_Click);
            // 
            // fEMMUsername
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1075, 675);
            this.Controls.Add(this.btn_SendEMR);
            this.Controls.Add(this.dgvEMM);
            this.Controls.Add(this.label1);
            this.Name = "fEMMUsername";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Emergency Mainternance Management";
            this.Load += new System.EventHandler(this.fEMMUsername_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvEMM)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgvEMM;
        private System.Windows.Forms.Button btn_SendEMR;
    }
}