using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.DAO.GiaoVien
{
    public class HomeDAO
    {
        SGU db = new SGU();
        public List<BaidangModel> Load3baidang(string maloai)
        {
            var res = (from a in db.Baidangs
                       where a.Maloai == maloai && a.Flag == true && (a.ĐoituongHT == "GV" || a.ĐoituongHT == "ALL")
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaBD = a.Mabaidang,
                           TieuDe = a.Tieude,
                           Ngaydang=a.Ngaydang
                       }).Take(3).ToList();
            return res;
        }
        public List<BaidangModel> LoadDaoTao()
        {
            int count = Convert.ToInt32(db.NoidungDTs.Count());

            var res = (from a in db.NoidungDTs join b in db.Loaidaotaos on a.MaloaiDT equals b.MaloaiDT
                       where a.Flag == true && a.MaloaiDT != "DH"
                       orderby a.Ngaydang ascending
                       select new BaidangModel
                       {
                           MaDaoTao = a.MaNDDT,
                           TieuDe = a.Tieude,
                           TenloaiDT=b.Tenloai,
                           MaLoaiDT=a.MaloaiDT
                           
                       }).Take(count-1).ToList();

            return res.OrderByDescending(s=>s.Ngaydang).ToList();


        }
        public List<BaidangModel> LoadSKKH()
        {
            int count = Convert.ToInt32(db.NoidungDTs.Count());

            var res = (from a in db.ChitietNCKHs join b in db.NghiencuuKHs on a.MaNCKH equals b.MaNCKH
                       where a.Flag == true && a.MaNCKH=="SK"
                       orderby a.Ngaydang ascending
                       select new BaidangModel
                       {
                           MaNCKH = a.MaCTNCKH,
                           TieuDe = a.Tieude,
                           MaLoaiNCKH=b.MaNCKH,
                           TenLoaiNCKH=b.TenNCKH
                       }).Take(count - 1).ToList();

            return res.OrderByDescending(s => s.Ngaydang).ToList();
        }
        public BaidangModel GetDaoTao()
        {
            var res = (from a in db.NoidungDTs
                       join b in db.Loaidaotaos on a.MaloaiDT equals b.MaloaiDT
                       where a.Flag == true
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaDaoTao = a.MaNDDT,
                           TieuDe = a.Tieude,
                           Ngaydang=a.Ngaydang,
                           TenloaiDT = b.Tenloai,
                           MaLoaiDT = a.MaloaiDT
                       }).Take(1).SingleOrDefault();
            return res;
        }
        public BaidangModel GetSKKH()
        {
            var res = (from a in db.ChitietNCKHs
                       join b in db.NghiencuuKHs on a.MaNCKH equals b.MaNCKH
                       where a.Flag == true
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaNCKH = a.MaCTNCKH,
                           TieuDe = a.Tieude,
                           Ngaydang = a.Ngaydang,
                            MaLoaiNCKH = b.MaNCKH,
                           TenLoaiNCKH = b.TenNCKH
                       }).Take(1).SingleOrDefault();
            return res;
        }

    }
}
