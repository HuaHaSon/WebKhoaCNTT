using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
using Model.ViewModel;
namespace Model.DAO.Guest
{
    public class DaoTaoDAO
    {
        SGU db = new SGU();
        public IEnumerable<NoidungDT> LoadList(string maloaidt,int page,int pagesize)
        {
            return db.NoidungDTs.Where(s => s.Flag == true && s.MaloaiDT == maloaidt).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public NoidungDT CTDT(string manddt)
        {
            return db.NoidungDTs.Where(s => s.MaNDDT == manddt).SingleOrDefault();
        }
        public IEnumerable<BaidangModel> LoadListALL(int page, int pagesize)
        {
            var res = (from a in db.NoidungDTs
                       join b in db.Loaidaotaos on a.MaloaiDT equals b.MaloaiDT
                       where a.Flag == true && a.MaloaiDT != "DH"
                       orderby a.Ngaydang ascending
                       select new BaidangModel
                       {
                           MaDaoTao = a.MaNDDT,
                           TieuDe = a.Tieude,
                           TenloaiDT = b.Tenloai,
                           MaLoaiDT = a.MaloaiDT,
                           Noidung=a.NoidungDT1

                       }).ToPagedList(page, pagesize);
            return res;
        }
        public string GetTenTK(string madt)
        {
            var res = db.NoidungDTs.Where(s => s.Flag == true && s.MaNDDT == madt).Select(s => s.Tentaikhoan).SingleOrDefault();
            return db.Thongtinnguoidungs.Where(s => s.Flag == true && s.Tentaikhoan == res).Select(s => s.Hoten).FirstOrDefault();
        }
    }
}
