using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnNhapMonCNPM.DAO
{
    internal class QLLop
    {
          public static DataTable ThongTinLop()
          {
               string sql = " select * from Lop";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }
          public static DataTable ThongTinHS_Lop(DTO.Lop a)
          {
               string sql = "select *from HOCSINH where malop=N'" + a.malop + "'";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }
          public static DataTable ThongTinKhoi()
          {
               string sql = " select * from Khoi";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }
          public static DataTable MaxMlop(DTO.Lop a)
          {
               string sql = "select top 1 malop from Lop where maKh='" + a.makhoi + "' order by malop desc";
               DataTable dt = new DataTable();
               dt = KNCSDL.DocDuLieu(sql);
               return dt;
          }
          public static void Luu(DTO.Lop a)
          {
               string sql = "insert into Lop values('" + a.malop + "',N'" + a.tenlop + "','" + a.makhoi + "','" + a.magv + "','" + a.siso + "')";
               KNCSDL.ThucThiTruyVan(sql);
          }
          public static void Sua(DTO.Lop a)
          {
               string sql = "update Lop set TenLop=N'" + a.tenlop + "', MaGV='" + a.magv + "', SiSo=N'" + a.siso + "' where MaLop='" + a.malop + "'";
               KNCSDL.ThucThiTruyVan(sql);
          }
          public static void Xoa(DTO.Lop a)
          {
               string sql = " delete from Lop where MaLop='" + a.malop + "'";
               KNCSDL.ThucThiTruyVan(sql);
          }
     }
}
