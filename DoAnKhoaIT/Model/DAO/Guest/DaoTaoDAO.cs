using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
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
    }
}
