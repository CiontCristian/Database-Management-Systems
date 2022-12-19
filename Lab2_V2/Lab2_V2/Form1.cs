using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab2_V2
{
    public partial class Form1 : Form
    {
        private SqlConnection connection;
        private SqlDataAdapter daChild, daParent;
        private DataSet dataSet;
        private SqlCommandBuilder commandBuilder;
        private BindingSource bsChild, bsParent;

        string sqlConnection = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        string childTable = ConfigurationManager.AppSettings["childTable"];
        string parentTable = ConfigurationManager.AppSettings["parentTable"];
        string selectChild = ConfigurationManager.AppSettings["selectChild"];
        string selectParent = ConfigurationManager.AppSettings["selectParent"];
        string parentKey = ConfigurationManager.AppSettings["parentKey"];
        string foreignKey = ConfigurationManager.AppSettings["foreignKey"];


        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            bsChild = new BindingSource();
            bsParent = new BindingSource();

            dgvChild.DataSource = bsChild;
            dgvParent.DataSource = bsParent;

            connection = new SqlConnection(sqlConnection);

            dataSet = new DataSet();

            daChild = new SqlDataAdapter(selectChild, connection);
            daParent = new SqlDataAdapter(selectParent, connection);

            commandBuilder = new SqlCommandBuilder(daChild);

            daParent.Fill(dataSet, parentTable);
            daChild.Fill(dataSet, childTable);

            DataRelation dataRelation = new DataRelation("Relation", dataSet.Tables[parentTable].Columns[parentKey], dataSet.Tables[childTable].Columns[foreignKey]);
            dataSet.Relations.Add(dataRelation);

            bsParent.DataSource = dataSet;
            bsParent.DataMember = parentTable;

            bsChild.DataSource = bsParent;
            bsChild.DataMember = "Relation";
        }

        private void updateDB_button_Click(object sender, EventArgs e)
        {
            daChild.Update(dataSet, childTable);
        }
    }
}
