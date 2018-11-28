using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class ThongBao_TinTucDAO
    {
        SGU db = new SGU();
        public IEnumerable<Baidang> ListALL(string tagid,int page,int pagesize)
        {
            return db.Baidangs.Where(s => db.Chitietbaidangs.Where(e => e.Mabaidang == s.Mabaidang && s.Flag == true && e.TagID == tagid && (s.ĐoituongHT=="SV"||s.ĐoituongHT=="ALL")).Any()).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public Baidang CTBD(string mabd)
        {
            return db.Baidangs.Where(s => s.Mabaidang == mabd).SingleOrDefault();
        }
    }
}
