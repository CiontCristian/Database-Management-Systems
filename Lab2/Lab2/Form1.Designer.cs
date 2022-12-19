namespace Lab2
{
    partial class Form1
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
            this.dgvParent = new System.Windows.Forms.DataGridView();
            this.dgvChild = new System.Windows.Forms.DataGridView();
            this.updateDB_button = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvParent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChild)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvParent
            // 
            this.dgvParent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvParent.Location = new System.Drawing.Point(37, 53);
            this.dgvParent.Name = "dgvParent";
            this.dgvParent.Size = new System.Drawing.Size(452, 150);
            this.dgvParent.TabIndex = 0;
            // 
            // dgvChild
            // 
            this.dgvChild.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChild.Location = new System.Drawing.Point(37, 254);
            this.dgvChild.Name = "dgvChild";
            this.dgvChild.Size = new System.Drawing.Size(452, 155);
            this.dgvChild.TabIndex = 1;
            // 
            // updateDB_button
            // 
            this.updateDB_button.Location = new System.Drawing.Point(527, 199);
            this.updateDB_button.Name = "updateDB_button";
            this.updateDB_button.Size = new System.Drawing.Size(249, 62);
            this.updateDB_button.TabIndex = 2;
            this.updateDB_button.Text = "Update DB";
            this.updateDB_button.UseVisualStyleBackColor = true;
            this.updateDB_button.Click += new System.EventHandler(this.updateDB_button_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.updateDB_button);
            this.Controls.Add(this.dgvChild);
            this.Controls.Add(this.dgvParent);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvParent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChild)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvParent;
        private System.Windows.Forms.DataGridView dgvChild;
        private System.Windows.Forms.Button updateDB_button;
    }
}

