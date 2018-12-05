using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using Model.ViewModel;
namespace Model.DAO.GiaoVien
{
    public class NghienCuuKH
    {
        SGU db = new SGU();
        public IEnumerable<BaidangModel> ListALL(int page,int pagesize)
        {
            var res = (from a in db.ChitietNCKHs
                       join b in db.NghiencuuKHs on a.MaNCKH equals b.MaNCKH
                       where a.Flag == true && a.MaNCKH == "SK"
                       orderby a.Ngaydang ascending
                       select new BaidangModel
                       {
                           MaNCKH = a.MaCTNCKH,
                           TieuDe = a.Tieude,
                           MaLoaiNCKH = b.MaNCKH,
                           TenLoaiNCKH = b.TenNCKH,
                           Noidung=a.Noidung

                       }).ToPagedList(page,pagesize);
            return res;
        }
        public ChitietNCKH CTNCKH(string manckh)
        {
            return db.ChitietNCKHs.Where(s => s.Flag == true && s.MaCTNCKH == manckh).SingleOrDefault();
        }
        public string GetTenTK(string manckh)
        {
            var res = db.ChitietNCKHs.Where(s => s.Flag == true && s.MaCTNCKH == manckh).Select(s=>s.Tentaikhoan).SingleOrDefault();
            return db.Thongtinnguoidungs.Where(s => s.Flag == true && s.Tentaikhoan==res).Select(s => s.Hoten).FirstOrDefault();
        }
    }
}
