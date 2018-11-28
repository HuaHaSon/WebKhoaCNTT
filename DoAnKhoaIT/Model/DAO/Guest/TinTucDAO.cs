using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class TinTucDAO
    {
        SGU db = new SGU();
        public IEnumerable<Baidang> ListTT(int page,int pagesize)
        {
            return db.Baidangs.Where(s => s.Flag == true && s.Maloai == "TT" && (s.ĐoituongHT == "SV" || s.ĐoituongHT == "ALL")).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public Baidang CTBDTT(string mabaidang)
        {
            return db.Baidangs.Where(s => s.Mabaidang == mabaidang && s.Flag == true).SingleOrDefault();
        }
    }
}
