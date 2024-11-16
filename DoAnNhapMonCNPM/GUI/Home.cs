using DoAnNhapMonCNPM.DAO;
using DoAnNhapMonCNPM.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnNhapMonCNPM.GUI
{
    public partial class Home : Form
    {
        TaiKhoan account;
        private string _username;
        public Home(string username)
        {
            InitializeComponent();
            _username = username; // Lưu thông tin từ Login
        }
        

        private void Home_Load(object sender, EventArgs e)
        {
            //Bo Tròn Logo
            system system = new system();
            system.BoTronLogo(picLogo);
            txtAccount.Text = _username;
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            GUI.Login login = new GUI.Login();
            this.Hide();
            login.ShowDialog();

            this.Show();
        }

        private void btnQLHS_Click(object sender, EventArgs e)
        {
            GUI.HocSinh guiHS = new GUI.HocSinh(txtAccount.Text);
            this.Hide();
            guiHS.ShowDialog();
            this.Show();
        }
    }
}
