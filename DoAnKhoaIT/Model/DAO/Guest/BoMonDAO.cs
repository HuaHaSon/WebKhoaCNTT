using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.DAO.Guest
{
    public class BoMonDAO
    {
        SGU db = new SGU();
        public Bomon LoadBM(string mabm)
        {
            return db.Bomons.Where(s => s.Flag == true && s.MaBM == mabm).SingleOrDefault();
        }
        public int SLTiensi(string mabm)
        {
            var res = db.ThongtinGVs.Where(s => s.Flag == true && s.MaBM == mabm && s.Chucvu.Contains("Tiến sĩ")).ToList();
            return res.Count();
        }
        public int SLThacsi(string mabm)
        {
            var res = db.ThongtinGVs.Where(s => s.Flag == true && s.MaBM == mabm && s.Chucvu.Contains("Thạc sĩ")).ToList();
            return res.Count();
        }
        public List<ThongtinGV> ThongtinGV(string mabm)
        {
            return db.ThongtinGVs.Where(s => s.Flag == true && s.MaBM == mabm).ToList();
        }
        public List<Monhoc> ListMH(string mabm)
        {
            return db.Monhocs.Where(s => s.Flag == true && s.MaBM == mabm).ToList();
        }
    }
}
