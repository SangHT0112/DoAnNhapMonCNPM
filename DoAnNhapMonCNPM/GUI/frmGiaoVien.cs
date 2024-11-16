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

          private void frmGiaoVien_Load(object sender, EventArgs e)
          {

          }

          private void lvDS_SelectedIndexChanged(object sender, EventArgs e)
          {

          }
     }
}
