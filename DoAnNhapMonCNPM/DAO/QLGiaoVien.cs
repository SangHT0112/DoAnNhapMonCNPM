using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnNhapMonCNPM.DAO
{
    internal class QLGiaoVien
    {
          public static DataTable Load_ComboBox_Khoi()
          {
               string sql = " select * from KHOI";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }

          public static DataTable Load_ComboBox_Lop()
          {
               string sql = " select * from LOP";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }

          public static DataTable Load_ListView()
          {
               string sql = " select * from GIAOVIEN";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }
          public static DataTable Them()
          {
               string sql = "select top 1 MaGV from GIAOVIEN order by MaGV desc";
               return KNCSDL.DocDuLieu(sql);
          }
          public static void Luu(DTO.GiaoVien gv)
          {
               string sql = $"INSERT INTO GIAOVIEN VALUES ('{gv.magv}', N'{gv.hotengv}', '{gv.ngsinh}', {gv.giotinh}, N'{gv.diachi}', '{gv.sdt}', '{gv.macv}', '{gv.makh}')";
               KNCSDL.ThucThiTruyVan(sql);
          }
     }
     
}
