using MaterialSkin.Controls;
using Microsoft.Reporting.WinForms;
using MySql.Data.MySqlClient;
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

namespace Reportes
{
    public partial class Home : MaterialForm
    {
        MySqlConnection conn = new MySqlConnection("Server= 127.0.0.1;Port=3306;Uid=root;Pwd=;DATABASE=systemgym;");
        MySqlDataReader dr = null;
        MySqlCommand com = null;
        public Home()
        {
            InitializeComponent();
        }
        public void ventas()
        {
            conn.Open();
            DataTable dt = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("call reporteVentas();", conn);
            dataAdapter.Fill(dt);
            reportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource reportDataSource = new ReportDataSource("DataSet1",dt);
            reportViewer1.LocalReport.DataSources.Add(reportDataSource);
            reportViewer1.RefreshReport();
            conn.Close();
            reportViewer1.RefreshReport();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            ventas();
            
            
            
        }
    }
}
