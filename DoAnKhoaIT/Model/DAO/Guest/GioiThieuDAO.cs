using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.DAO.Guest
{
    public class GioiThieuDAO
    {
        SGU db = new SGU();
        public NoidungGT LoadGTC(string tieude)
        {
            return db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "TTC" && s.Tieude == tieude).SingleOrDefault();
        }
        public NoidungGT LoadCCTC(string tieude)
        {
            return db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "CCTC" && s.Tieude == tieude).SingleOrDefault();
        }
    }
}
