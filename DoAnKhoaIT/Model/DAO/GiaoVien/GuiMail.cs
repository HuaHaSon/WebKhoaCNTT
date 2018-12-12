using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.DAO.GiaoVien
{
    public class GuiMail
    {
        SGU db = new SGU();
        public IEnumerable<ModelMail> LoadThuDen(string tentk,string txtsearch)
        {
            if(txtsearch==null)
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on a.Taikhoangui equals c.Tentaikhoan
                           where b.Taikhoannhan == tentk && (b.Flag == 2 || b.Flag == 3)
                           orderby b.Ngaynhan descending
                           select new ModelMail
                           {
                               mact=b.Machuyentiep,
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
            else
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on a.Taikhoangui equals c.Tentaikhoan
                           where b.Taikhoannhan == tentk && (b.Flag == 2 || b.Flag == 3) && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                           orderby b.Ngaynhan descending
                           select new ModelMail
                           {
                               mact = b.Machuyentiep,
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
            
           
        }
        public IEnumerable<ModelMail> LoadThuGui(string tentk,string txtsearch)
        {
            if(txtsearch==null)
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && (a.Flag == 2 || a.Flag == 3)
                           orderby a.Ngaychuyen descending
                           select new ModelMail
                           {
                               mact=a.Machuyentiep,
                               tentknhan = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
            else
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && (a.Flag == 2 || a.Flag == 3) && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                           orderby a.Ngaychuyen descending
                           select new ModelMail
                           {
                               mact = a.Machuyentiep,
                               tentknhan = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
          
        }
        public int CountHTD(string tentk)
        {
            var res = db.Thongbaochuyentieps.Where(s => db.Chitietchuyentieps.Where(e => e.Machuyentiep == s.Machuyentiep && e.Taikhoannhan == tentk && (e.Flag==2 || e.Flag==3)).Any()).Count();
            return res;
        }
        public int CountTDG(string tentk)
        {
            var res = db.Thongbaochuyentieps.Where(s => db.Chitietchuyentieps.Where(e => e.Machuyentiep == s.Machuyentiep && s.Taikhoangui == tentk && (s.Flag == 2 || s.Flag == 3)).Any()).Count();
            return res;
        }
        public IEnumerable<ModelMail> LoadThuXoa(string tentk,string txtsearch)
        {
            if(txtsearch==null)
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && a.Flag == 1
                           orderby a.Ngaychuyen descending, a.Flag descending
                           select new ModelMail
                           {
                               mact = a.Machuyentiep,
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();

                List<ModelMail> result = res;

                var res1 = (from a in db.Thongbaochuyentieps
                            join b in db.Chitietchuyentieps
                             on a.Machuyentiep equals b.Machuyentiep
                            join c in db.Thongtinnguoidungs
                            on a.Taikhoangui equals c.Tentaikhoan
                            where b.Taikhoannhan == tentk && b.Flag == 1
                            orderby b.Ngaynhan descending, a.Flag descending
                            select new ModelMail
                            {
                                mact = b.Machuyentiep,
                                tentkgui = c.Hoten,
                                ngaynhan = b.Ngaynhan,
                                ngaychuyen = a.Ngaychuyen,
                                noidung = a.Noidung,
                                tieude = a.Tieude,
                                trangthaichuyen = b.Trangthaichuyen
                            }).ToList();

                foreach (ModelMail e in res1)
                {
                    result.Add(e);
                }
                return result;
            }
            else
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && a.Flag == 1 && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                           orderby a.Ngaychuyen descending, a.Flag descending
                           select new ModelMail
                           {
                               mact = a.Machuyentiep,
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();

                List<ModelMail> result = res;

                var res1 = (from a in db.Thongbaochuyentieps
                            join b in db.Chitietchuyentieps
                             on a.Machuyentiep equals b.Machuyentiep
                            join c in db.Thongtinnguoidungs
                            on a.Taikhoangui equals c.Tentaikhoan
                            where b.Taikhoannhan == tentk && b.Flag == 1 && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                            orderby b.Ngaynhan descending, a.Flag descending
                            select new ModelMail
                            {
                                mact = b.Machuyentiep,
                                tentkgui = c.Hoten,
                                ngaynhan = b.Ngaynhan,
                                ngaychuyen = a.Ngaychuyen,
                                noidung = a.Noidung,
                                tieude = a.Tieude,
                                trangthaichuyen = b.Trangthaichuyen
                            }).ToList();

                foreach (ModelMail e in res1)
                {
                    result.Add(e);
                }
                return result;

            }

        }
        public IEnumerable<ModelMail> LoadThuNhap(string tentk,string txtsearch)
        {
            if(txtsearch==null)
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && a.Flag == 0 
                           orderby a.Ngaychuyen descending, a.Flag descending
                           select new ModelMail
                           {
                               mact = a.Machuyentiep,
                               tentknhan = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
            else
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on b.Taikhoannhan equals c.Tentaikhoan
                           where a.Taikhoangui == tentk && a.Flag == 0 && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                           orderby a.Ngaychuyen descending, a.Flag descending
                           select new ModelMail
                           {
                               mact = a.Machuyentiep,
                               tentknhan = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaichuyen = b.Trangthaichuyen
                           }).ToList();
                return res;
            }
            
        }
        public IEnumerable<ModelMail> LoadThuQuanTrong(string tentk,string txtsearch)
        {
            if(txtsearch==null)
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on a.Taikhoangui equals c.Tentaikhoan
                           where b.Taikhoannhan == tentk && (b.Flag == 2 || b.Flag == 3)
                           orderby b.Flag descending
                           select new ModelMail
                           {
                               mact = b.Machuyentiep,
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaixem = b.Trangthaixem
                           }).ToList();
                return res;
            }
            else
            {
                var res = (from a in db.Thongbaochuyentieps
                           join b in db.Chitietchuyentieps
                            on a.Machuyentiep equals b.Machuyentiep
                           join c in db.Thongtinnguoidungs
                           on a.Taikhoangui equals c.Tentaikhoan
                           where b.Taikhoannhan == tentk && (b.Flag == 2 || b.Flag == 3) && (a.Tieude.Contains(txtsearch) || a.Noidung.Contains(txtsearch) || c.Hoten.Contains(txtsearch))
                           orderby b.Flag descending
                           select new ModelMail
                           {
                               tentkgui = c.Hoten,
                               ngaynhan = b.Ngaynhan,
                               ngaychuyen = a.Ngaychuyen,
                               noidung = a.Noidung,
                               tieude = a.Tieude,
                               trangthaixem = b.Trangthaixem
                           }).ToList();
                return res;
            }
           
        }
        public Thongtinnguoidung GetTen(string tentk)
        {
            return db.Thongtinnguoidungs.Where(s => s.Flag == true && s.Tentaikhoan == tentk).SingleOrDefault();
        }
        public string GetMail(string tentk)
        {
            return db.Thongtinnguoidungs.Where(s => s.Flag == true && s.Tentaikhoan == tentk).Select(s=>s.Gmail).FirstOrDefault();
        }
        public void ThemTBCT(string tentkgui,FormMail model)
        {
            Thongbaochuyentiep tb = new Thongbaochuyentiep();            
            tb.Taikhoangui = tentkgui;
            tb.Tieude = model.tieude;
            tb.Noidung = model.noidung;
            tb.Ngaychuyen = DateTime.Now;
            if (model.flag == "1")
                tb.Flag = 2;
            else tb.Flag = 3;
            db.Thongbaochuyentieps.Add(tb);
            db.SaveChanges();           
        }
        public void ThemCTCT(string tentknhan,string mact,string flag)
        {
            Chitietchuyentiep ct = new Chitietchuyentiep();           
            ct.Machuyentiep = Convert.ToInt32(mact);
            var tennhan = db.Thongtinnguoidungs.Where(s => s.Gmail == tentknhan).Select(s => s.Tentaikhoan).FirstOrDefault();
            ct.Taikhoannhan = tennhan;
            ct.Ngaynhan = DateTime.Now;
            ct.Trangthaixem = "Chưa xem";
            ct.Trangthaichuyen = "Đã chuyển";
            ct.Flag = Convert.ToInt32(flag);
            db.Chitietchuyentieps.Add(ct);
            db.SaveChanges();
        }
        public FormMail CTMail(string tentk,int mact)
        {
            var res = (from a in db.Thongbaochuyentieps
                       join b in db.Chitietchuyentieps
                        on a.Machuyentiep equals b.Machuyentiep
                       join c in db.Thongtinnguoidungs
                       on a.Taikhoangui equals c.Tentaikhoan
                       where b.Machuyentiep == mact && b.Taikhoannhan == tentk
                       select new FormMail
                       {
                           hoten = c.Hoten,
                           email = c.Gmail,
                           tieude = a.Tieude,
                           noidung = a.Noidung,
                           trangthaixem = b.Trangthaixem,
                           ngaynhan = b.Ngaynhan
                       }).SingleOrDefault();
            return res;
        }
        public FormMail CTMailGui(string tentk, int mact)
        {
            var res = (from a in db.Thongbaochuyentieps
                       join b in db.Chitietchuyentieps
                        on a.Machuyentiep equals b.Machuyentiep
                       join c in db.Thongtinnguoidungs
                       on b.Taikhoannhan equals c.Tentaikhoan
                       where a.Machuyentiep == mact && a.Taikhoangui == tentk
                       select new FormMail
                       {
                           hoten = c.Hoten,
                           email = c.Gmail,
                           tieude = a.Tieude,
                           noidung = a.Noidung,
                           trangthaichuyen = b.Trangthaichuyen,
                           ngaygui = a.Ngaychuyen,
                       }).SingleOrDefault();
            return res;
        }
        public void GetTT(string tentk,int mact)
        {
            var res = db.Chitietchuyentieps.Where(s => s.Taikhoannhan == tentk && s.Machuyentiep == mact).SingleOrDefault();
            res.Trangthaixem = "Đã xem";
            db.SaveChanges();
        }
        
        
    }
}
