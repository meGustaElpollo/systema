using MaterialSkin;
using MaterialSkin.Controls;
using Microsoft.Reporting.WinForms;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Reportes
{
    public partial class InicioReportes : MaterialForm

    {
        MySqlConnection conn = new MySqlConnection("Server= 127.0.0.1;Port=3306;Uid=root;Pwd=;DATABASE=systemgym;");
        MySqlDataReader dr = null;
        MySqlCommand com = null;
        public MaterialSkinManager materialSkinManager = MaterialSkinManager.Instance;
        public MaterialSkinManager themeColorPadre = MaterialSkinManager.Instance;
        public MaterialSkinManager colorPadre = MaterialSkinManager.Instance;
        public InicioReportes()
        {
            themeColorPadre.Theme = MaterialSkinManager.Themes.LIGHT;
            colorPadre.ColorScheme = new ColorScheme(Primary.Red900, Primary.Red900, Primary.LightBlue800, Accent.DeepOrange400, TextShade.WHITE);
            InitializeComponent();
        }

        private void materialCard3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnVentasPorPeriodo_CheckedChanged(object sender, EventArgs e)
        {
            
            var fecha1 = dateTimeVentas1.Value.Date.ToString("yyyy-MM-dd");
            var fecha2 = dateTimeVentas2.Value.Date.ToString("yyyy-MM-dd");
            conn.Open();
            DataTable dt = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("call reporteVentas('"+fecha1+"','"+fecha2+"');", conn);
            dataAdapter.Fill(dt);
            reportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource reportDataSource = new ReportDataSource("DataSet1", dt);
            reportViewer1.LocalReport.DataSources.Add(reportDataSource);
            reportViewer1.RefreshReport();
            conn.Close();
        }

        private void btnBuscarEntradaSalida_Click(object sender, EventArgs e)
        {
            var fecha1 = metroDateTimeEntrada.Value.Date.ToString("yyyy-MM-dd");
            var fecha2 = metroDateTimeEntrada2.Value.Date.ToString("yyyy-MM-dd");
            conn.Open();
            DataTable dt = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("call reporteEntradas('" + fecha1 + "','" + fecha2 + "');", conn);
            dataAdapter.Fill(dt);
            reportViewerEntradaSalida.LocalReport.DataSources.Clear();
            ReportDataSource reportDataSource = new ReportDataSource("DataSet1", dt);
            reportViewerEntradaSalida.LocalReport.DataSources.Add(reportDataSource);
            reportViewerEntradaSalida.RefreshReport();
            conn.Close();
            //reportViewer1.RefreshReport();
        }

        private void metroDateTime6_ValueChanged(object sender, EventArgs e)
        {

        }

        private void metroDateTime5_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnIngresosPorMembresias_CheckedChanged(object sender, EventArgs e)
        {
            var fecha1 = metroDateTimeMembresia1.Value.Date.ToString("yyyy-MM-dd");
            var fecha2 = metroDateTimeMembresia2.Value.Date.ToString("yyyy-MM-dd");
            conn.Open();
            DataTable dt = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("call reporteEntradas('" + fecha1 + "','" + fecha2 + "');", conn);
            dataAdapter.Fill(dt);
            reportViewerEntradaSalida.LocalReport.DataSources.Clear();
            ReportDataSource reportDataSource = new ReportDataSource("DataSet1", dt);
            reportViewerEntradaSalida.LocalReport.DataSources.Add(reportDataSource);
            reportViewerEntradaSalida.RefreshReport();
            conn.Close();
        }

        private void InicioReportes_Load(object sender, EventArgs e)
        {

        }
    }
}
