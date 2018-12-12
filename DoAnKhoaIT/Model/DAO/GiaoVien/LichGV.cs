using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.DAO.GiaoVien
{
    
    public class LichGV
    {
        SGU db = new SGU();
        public List<LichGV_TheoNgay> LoadALL(string mact)
        {
            //var res = from a in db.ChitietCTGVs                    
            //          where a.Flag == true
            //          group a by  a.NgayCT.Value.ToString("dd/MM/yyyy") into b
            //          select new LichGV_TheoNgay
            //          {
            //              Ngay = b.Key.
            //          };
            var res = db.ChitietCTGVs.Where(e => e.Flag == true &&e.MaCT == mact).OrderBy(e=>e.NgayCT).GroupBy(e => EntityFunctions.TruncateTime(e.NgayCT)).Select(e => new LichGV_TheoNgay { Ngay = e.Key}).ToList();
            List<LichGV_TheoNgay>  res2 = new List<LichGV_TheoNgay>();
            string s = "";
            foreach (var item in res)
            {
                s = GetThu(item.Ngay);
                LichGV_TheoNgay n = new LichGV_TheoNgay();
                n.thu = s;
                n.Ngay = item.Ngay;
                res2.Add(n);
               
            }
            return res2.OrderBy(e=>e.Ngay).ToList();
           
        }
        public List<LichGV_TheoNgay> LoadTheoNgay(string mact)
        {
            var res = db.ChitietCTGVs.Where(s => s.Flag == true && s.MaCT==mact).OrderBy(s=>s.NgayCT).GroupBy(s => EntityFunctions.TruncateTime(s.NgayCT)).Select(s => new LichGV_TheoNgay { Ngay = s.Key }).ToList();
            var res2 = db.ChitietCTGVs.Where(s => s.Flag == true && s.MaCT == mact).OrderBy(s=>s.NgayCT).Select(s => s.NgayCT).ToList();
            var c = new List<LichGV_TheoNgay>();
            var d = new List<LichGV_TheoNgay>();
            DateTime dt = new DateTime();
            foreach (var item in res)
            {
                foreach(var i in res2)
                {
                    if(i.Value.ToString("dd/MM/yyyy")==item.Ngay.Value.ToString("dd/MM/yyyy"))
                    {
                        LichGV_TheoNgay n = new LichGV_TheoNgay();
                        dt = Convert.ToDateTime(i);
                        TimeSpan t = dt.TimeOfDay;
                        n.thoigian = t.ToString();
                        n.Ngay = item.Ngay;
                        d.Add(n);
                    }
                   
                }               
            }
            foreach (var b in d)
            {
                LichGV_TheoNgay n = new LichGV_TheoNgay();
                var res3 =from a in db.ChitietCTGVs
                           where a.NgayCT.ToString().Contains(b.thoigian) && a.NgayCT.ToString().Contains(b.Ngay.ToString()) && a.MaCT == mact
                           select a;
                n.Noidung = res3.Select(s => s.Noidung).ToString();
                n.Thanhphan = res3.Select(s => s.Thanhphan).ToString();
                n.ChuTri= res3.Select(s => s.Chutri).ToString();
                n.Diadiem = res3.Select(s => s.Diadiem).ToString();
                n.thoigian = b.thoigian;
                n.Ngay = b.Ngay;
                c.Add(n);
                //c = db.ChitietCTGVs.AsEnumerable().Where(s => s.NgayCT.ToString().Contains(b.thoigian) && (s.NgayCT.Value.ToString("dd/MM/yyyy")==b.Ngay.Value.ToString("dd/MM/yyyy")) && s.MaCT == mact).Select(s => new LichGV_TheoNgay {  Noidung=s.Noidung,Thanhphan=s.Thanhphan,Diadiem=s.Diadiem,ChuTri=s.Chutri,thoigian = b.thoigian }).ToList();             
            }
            return c.OrderBy(e => e.Ngay).ToList();

        }
        public string GetThu(DateTime? ngayct)
        {
            LichGV_TheoNgay a = new LichGV_TheoNgay();
            var thang = Convert.ToInt32(ngayct.Value.ToString("MM"));
            var nam= Convert.ToInt32(ngayct.Value.ToString("yyyy"));
            var ngay= Convert.ToInt32(ngayct.Value.ToString("dd"));
            string thu = "";
            int number;
            if (thang < 3)
            {
                thang = thang + 12;
                nam = nam - 1;
            }                                           
               number  = (ngay + 2 * thang + (3 * (thang + 1)) / 5 + nam + (nam / 4)) %7;
            switch (number)
            {
                case 0:
                    thu="Chủ Nhật";
                    break;
                case 1:
                    thu = "Thứ 2";
                    break;
                case 2:
                    thu = "Thứ 3";
                    break;
                case 3:
                    thu = "Thứ 4";
                    break;
                case 4:
                    thu = "Thứ 5";
                    break;
                case 5:
                   thu = "Thứ 6";
                    break;
                case 6:
                    thu = "Thứ 7";
                    break;
            }
            return thu;
                     
        }
    }
}
