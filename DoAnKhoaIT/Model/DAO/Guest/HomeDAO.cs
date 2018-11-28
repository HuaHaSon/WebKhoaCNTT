using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using Model.ViewModel;
namespace Model.DAO.Guest
{
    public class HomeDAO
    {
        SGU db = new SGU();
        public List<BaidangModel> Load3baidang(string maloai)
        {
            var res = (from a in db.Baidangs
                       where a.Maloai == maloai && a.Flag == true
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaBD = a.Mabaidang,
                           TieuDe = a.Tieude
                       }).Take(3).ToList();
            return res;

        }
        public List<BaidangModel> ListALL()
        {

            var res = (from a in db.Baidangs
                       where a.Flag == true
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaBD = a.Mabaidang,
                           TieuDe = a.Tieude,
                           Ngaydang = a.Ngaydang
                       }).Take(10).ToList();
            return res;
        }
        public List<BaidangModel> ListHDSV(string tag)
        {
            var res = (from a in db.Baidangs
                       join b in db.Chitietbaidangs on a.Mabaidang equals b.Mabaidang
                       where a.Maloai == "HDSV" && a.Flag == true && b.TagID == tag && b.Flag == true
                       orderby a.Ngaydang descending
                       select new BaidangModel
                       {
                           MaBD = a.Mabaidang,
                           TieuDe = a.Tieude
                       }).Take(3).ToList();
            return res;
        }
    }
}
