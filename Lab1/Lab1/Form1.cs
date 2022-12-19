using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab1
{
    public partial class Form1 : Form
    {
        private SqlConnection connection;
        private SqlDataAdapter daInternalDep, daSuppliers;
        private DataSet dataSet;
        private SqlCommandBuilder commandBuilder;
        private BindingSource bsInternalDep, bsSuppliers;

        private void updateDB_Button_Click(object sender, EventArgs e)
        {
            daInternalDep.Update(dataSet, "InternalDepartment");
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            bsInternalDep = new BindingSource();
            bsSuppliers = new BindingSource();

            dgvInternalDep.DataSource = bsInternalDep;
            dgvSuppliers.DataSource = bsSuppliers;

            connection = new SqlConnection("Data Source = CRISTI-DESKTOP\\SQLEXPRESS01; Initial Catalog = GamingCompanyDB; Integrated Security = true");

            dataSet = new DataSet();

            daInternalDep = new SqlDataAdapter("SELECT * FROM InternalDepartment", connection);
            daSuppliers = new SqlDataAdapter("SELECT * FROM Supplier", connection);

            commandBuilder = new SqlCommandBuilder(daInternalDep);

            daInternalDep.Fill(dataSet, "InternalDepartment");
            daSuppliers.Fill(dataSet, "Supplier");

            DataRelation dataRelation = new DataRelation("Relation", dataSet.Tables["Supplier"].Columns["SUPid"], dataSet.Tables["InternalDepartment"].Columns["IDsupplier"]);
            dataSet.Relations.Add(dataRelation);

            bsSuppliers.DataSource = dataSet;
            bsSuppliers.DataMember = "Supplier";

            bsInternalDep.DataSource = bsSuppliers;
            bsInternalDep.DataMember = "Relation";
        }
    }
}
