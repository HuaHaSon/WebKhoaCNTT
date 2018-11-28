using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.DAO.Guest
{
    public class BMTTDAO
    {
        SGU db = new SGU();
        public IEnumerable<NoidungBMTT> ListALL(string mabm,int page,int pagesize)
        {
            return db.NoidungBMTTs.Where(s => s.flag == true && s.MaBMTT == mabm).OrderByDescending(s => s.Ngaydang).ToPagedList(page, pagesize);
        }
        public NoidungBMTT CTBD(string mandbm)
        {
            return db.NoidungBMTTs.Where(s => s.flag == true && s.MaNDBMTT == mandbm).SingleOrDefault();
        }
    }
}
