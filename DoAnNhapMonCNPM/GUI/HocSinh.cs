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
        public HocSinh()
        {
            InitializeComponent();
        }

        private void HocSinh_Load(object sender, EventArgs e)
        {
            //Bo Tròn Logo
            system s = new system();
            s.BoTronLogo(picLogo);

        }

    }
}
