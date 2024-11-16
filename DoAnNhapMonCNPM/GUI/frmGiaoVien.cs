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
     public partial class frmGiaoVien : Form
     {
          private string _username;
          public frmGiaoVien(string username)
          {
               InitializeComponent();
               _username = username;
               lbAccount.Text = _username;
          }
          void HienThiComboBoxKhoi()
          {
               DataTable dt = new DataTable();
               dt = QLHocSinh.Load_ComboBox_Khoi();
               cboKhoi.DataSource = dt;
               cboKhoi.ValueMember = "MaKhoi";
               cboKhoi.DisplayMember = "TenKhoi";
          }


          void HienThi_ListView(DataTable dt)
          {
               lvDS.Items.Clear();
               for (int i = 0; i < dt.Rows.Count; i++)
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


          }
          private void frmGiaoVien_Load(object sender, EventArgs e)
          {
               HienThiComboBoxKhoi();
               HienThi_ListView(QLGiaoVien.Load_ListView());
               cboGT.Items.Add("Nam");
               cboGT.Items.Add("Nữ");
          }
          
          private void cboKhoi_SelectedIndexChanged(object sender, EventArgs e)
          {
               string MaKhoi = cboKhoi.SelectedValue.ToString();
               DataTable dtGV = KNCSDL.DocDuLieu($"select * from GIAOVIEN where MaKhoi = '{MaKhoi}'");
               HienThi_ListView(dtGV);
          }

          private void lvDS_Click(object sender, EventArgs e)
          {
               txtMaGV.Text = lvDS.SelectedItems[0].SubItems[0].Text;
               txtHoTen.Text = lvDS.SelectedItems[0].SubItems[1].Text;
               dateNgaySinh.Value = Convert.ToDateTime(lvDS.SelectedItems[0].SubItems[2].Text);
               cboGT.Text = lvDS.SelectedItems[0].SubItems[3].Text;
               txtDiaChi.Text = lvDS.SelectedItems[0].SubItems[4].Text;
               txtSDT.Text = lvDS.SelectedItems[0].SubItems[5].Text;
          }

          private void btnThem_Click(object sender, EventArgs e)
          {
               DataTable dtmatang = QLGiaoVien.Them();
               string mahientai = dtmatang.Rows[0]["MaGV"].ToString();
               // Tách phần chữ "GV" và phần số
               string catchu = mahientai.Substring(0, 2);
               int catma = int.Parse(mahientai.Substring(2)); // Chuyển phần số thành kiểu int
               // Tăng mã lên 1 và định dạng lại để giữ số lượng chữ số cố định
               int mamoi = catma + 1;
               string maMoiFormat = catchu + mamoi.ToString("D2"); // Định dạng để luôn có 2 chữ số
               // Gán mã mới vào TextBox
               txtMaGV.Text = maMoiFormat;
          }

          private void btnLuu_Click(object sender, EventArgs e)
          {
               if (txtMaGV.Text.Length == 0 || txtHoTen.Text.Length == 0 || cboGT.Text.Length == 0 || txtDiaChi.Text.Length == 0 || txtSDT.Text.Length == 0 || cbbCongViec.Text.Length == 0 || cboKhoi.Text.Length == 0) MessageBox.Show("Ban chua nhap du thong tin!", "Thong bao", MessageBoxButtons.OK);
               else
               {
                    DTO.GiaoVien gv = new DTO.GiaoVien
                    {
                         magv = txtMaGV.Text,
                         hotengv = txtHoTen.Text,
                         ngsinh = dateNgaySinh.Value.ToString(),
                         diachi = txtDiaChi.Text,
                         sdt = txtSDT.Text,
                         giotinh = (cboGT.Text == "Nam") ? "1" : "0",
                         macv = cbbCongViec.SelectedValue?.ToString(),
                         makh = cboKhoi.SelectedValue?.ToString()
                    };

                    // Lưu vào CSDL
                    QLGiaoVien.Luu(gv);

                    // Cập nhật lại ListView sau khi lưu
                    MessageBox.Show("Lưu thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    HienThi_ListView(QLGiaoVien.Load_ListView());
               }
          }

          private void cbbCongViec_SelectedIndexChanged(object sender, EventArgs e)
          {
               string MaCV = cbbCongViec.SelectedValue.ToString();
               DataTable dtGV = KNCSDL.DocDuLieu($"select * from GIAOVIEN where MaCV = '{MaCV}'");
               HienThi_ListView(dtGV);
          }
     }
}
