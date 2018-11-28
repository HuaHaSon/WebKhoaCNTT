using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class ThongTinTSDAO
    {
        SGU db = new SGU();
        public IEnumerable<Baidang> ListTS(int page, int pagesize)
        {
            return db.Baidangs.Where(s => s.Flag == true && s.Maloai == "TS" && (s.ĐoituongHT == "SV" || s.ĐoituongHT == "ALL")).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public Baidang CTBD(string mabaidang)
        {
            return db.Baidangs.Where(s => s.Mabaidang == mabaidang).SingleOrDefault();
        }
    }
}
