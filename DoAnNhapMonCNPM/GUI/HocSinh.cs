using DoAnNhapMonCNPM.DAO;
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
    public partial class HocSinh : Form
    {

        private string _username;

        public HocSinh(string username)
        {
            InitializeComponent();
            _username = username;
        }

        void HienThiComboBoxKhoi()
        {
            DataTable dt = new DataTable();
            dt = QLHocSinh.Load_ComboBox_Khoi();
            cboKhoi.DataSource = dt;
            cboKhoi.ValueMember = "MaKhoi";
            cboKhoi.DisplayMember = "TenKhoi";

            // Gọi lại phương thức để cập nhật Lớp theo Khối ngay khi ComboBox Khối thay đổi
            HienThiComboBoxLop();
        }

        void HienThiComboBoxLop()
        {
            string MaKhoi = cboKhoi.SelectedValue.ToString();
            DataTable dt = new DataTable();
            // Lấy dữ liệu các lớp của khối đã chọn
            dt = KNCSDL.DocDuLieu($"select * from LOP where MaKhoi = '{MaKhoi}'");

            // Cập nhật lại ComboBox Lớp
            cboLop.DataSource = dt;
            cboLop.ValueMember = "MaLop";
            cboLop.DisplayMember = "TenLop";
        }

        void HienThi_ListView(DataTable dt)
        {
            lvDS.Items.Clear();
            for(int i = 0; i < dt.Rows.Count; i++)
            {


                lvDS.Items.Add(dt.Rows[i][0].ToString());
                lvDS.Items[i].SubItems.Add(dt.Rows[i][1].ToString());
                lvDS.Items[i].SubItems.Add(dt.Rows[i][2].ToString());
                string gioitinh = "";
                if (dt.Rows[i][3].ToString() == "True")
                    gioitinh = "Nam";
                else
                    gioitinh = "Nữ";
                
                lvDS.Items[i].SubItems.Add(gioitinh);
                lvDS.Items[i].SubItems.Add(dt.Rows[i][4].ToString());
                lvDS.Items[i].SubItems.Add(dt.Rows[i][5].ToString());
                lvDS.Items[i].SubItems.Add(dt.Rows[i][6].ToString());
                lvDS.Items[i].SubItems.Add(dt.Rows[i][7].ToString());
            }
        }

        void HienThiTheoKhoiVaComboBox()
        {
            string MaKhoi = cboKhoi.SelectedValue.ToString();
            string MaLop = cboLop.SelectedValue.ToString();


        }

        private void HocSinh_Load(object sender, EventArgs e)
        {
            //Bo Tròn Logo
            system s = new system();
            s.BoTronLogo(picLogo);
            lbAccount.Text = _username;


            HienThiComboBoxKhoi();
            HienThiComboBoxLop();
            HienThi_ListView(QLHocSinh.Load_ListView());
        }

        private void cboKhoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            HienThiComboBoxLop();
            string MaKhoi = cboKhoi.SelectedValue.ToString();
            DataTable dtHS = KNCSDL.DocDuLieu($"select * from HocSinh where MaKhoi = '{MaKhoi}'");
            HienThi_ListView(dtHS);

        }


        private void cboLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            string MaLop = cboLop.SelectedValue.ToString();
            string MaKhoi = cboKhoi.SelectedValue.ToString();
            // Đảm bảo rằng dữ liệu trong ListView được cập nhật khi thay đổi lớp
            DataTable dt = new DataTable();
            dt = KNCSDL.DocDuLieu($"select * from HOCSINH where MaKhoi = '{MaKhoi}' and MaLop ='{MaLop}'");

            // Hiển thị danh sách học sinh theo lớp và khối
            HienThi_ListView(dt);
        }

        private void lvDS_Click(object sender, EventArgs e)
        {
            txtMaHS.Text = lvDS.SelectedItems[0].SubItems[0].Text;
            txtHoTen.Text = lvDS.SelectedItems[0].SubItems[1].Text;
            dateNgaySinh.Value = Convert.ToDateTime(lvDS.SelectedItems[0].SubItems[2].Text);
            cboGT.Text = lvDS.SelectedItems[0].SubItems[3].Text;
            txtDiaChi.Text = lvDS.SelectedItems[0].SubItems[4].Text;
            txtSDT.Text = lvDS.SelectedItems[0].SubItems[5].Text;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
