using DoAnNhapMonCNPM.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnNhapMonCNPM.DAO
{
    internal class Login
    {
        public static DataTable KTTaiKhoan(TaiKhoan a)
        {
            string sql = " select * from NGUOIDUNG where TenDangNhap=N'" + a.tendn + "' and MatKhau=N'" + a.matkhau + "'";
            DataTable dt = new DataTable();
            dt = KNCSDL.DocDuLieu(sql);
            return dt;
        }
    }
}
