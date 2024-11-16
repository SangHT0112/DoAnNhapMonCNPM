using DoAnNhapMonCNPM.DAO;
using DoAnNhapMonCNPM.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnNhapMonCNPM.GUI
{
    public partial class Login : Form
    {
        TaiKhoan account;
        public Login()
        {
            InitializeComponent();
        }
        private void Login_Load(object sender, EventArgs e)
        {
            //Bo Tròn Logo
            system s = new system();
            s.BoTronLogo(picLogo);
        }
        public static string loaitk;

        private void btnDN_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            account = new TaiKhoan();
            account.tendn = txtTK.Text;
            account.matkhau = txtMK.Text;
            dt = DAO.Login.KTTaiKhoan(account);
            if (dt.Rows.Count == 0)

                MessageBox.Show("Ten dang nhap hoac mat khau khong chinh xac!", "Thong Bao", MessageBoxButtons.OK, MessageBoxIcon.Warning);


            else
            {
                loaitk = dt.Rows[0][3].ToString();
                MessageBox.Show("Dang nhap thanh cong!", "Thong Bao", MessageBoxButtons.OK, MessageBoxIcon.Information);
                // Truyền tên đăng nhập sang Home
                GUI.Home homeForm = new GUI.Home(txtTK.Text);
                this.Hide();
                homeForm.ShowDialog();
                this.Show();
                
            }
        }

        private void btnDK_Click(object sender, EventArgs e)
        {
            GUI.DangKy frmDangKy = new GUI.DangKy();
            this.Hide();
            frmDangKy.ShowDialog();
            this.Show();
        }
    }
}
