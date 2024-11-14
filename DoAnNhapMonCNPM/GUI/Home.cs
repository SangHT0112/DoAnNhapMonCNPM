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
        public Home()
        {
            InitializeComponent();
        }

        private void picLogo_Paint(object sender, PaintEventArgs e)
        {
                // Tạo GraphicsPath để vẽ hình tròn
                System.Drawing.Drawing2D.GraphicsPath path = new System.Drawing.Drawing2D.GraphicsPath();
                path.AddEllipse(0, 0, picLogo.Width, picLogo.Height);

                // Áp dụng vùng cắt (clipping region)
                picLogo.Region = new Region(path);
        }
    }
}
