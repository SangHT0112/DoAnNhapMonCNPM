using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnNhapMonCNPM.DAO
{
    internal class QLHocSinh
    {

        public static DataTable Load_ComboBox_Khoi()
        {
            string sql = " select * from Khoi";
            DataTable dt = new DataTable();
            dt = KNCSDL.DocDuLieu(sql);
            return dt;
        }

        public static DataTable Load_ComboBox_Lop()
        {
            string sql = " select * from Lop";
            DataTable dt = new DataTable();
            dt = KNCSDL.DocDuLieu(sql);
            return dt;
        }

        public static DataTable Load_ListView()
        {
            string sql = " select * from HocSinh";
            DataTable dt = new DataTable();
            dt = KNCSDL.DocDuLieu(sql);
            return dt;
        }
    }
}
