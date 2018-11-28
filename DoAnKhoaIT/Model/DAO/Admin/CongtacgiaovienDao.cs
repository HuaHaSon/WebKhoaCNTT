using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class CongtacgiaovienDao
    {
        SGU db = null;
        public CongtacgiaovienDao()
        {
            db = new SGU();
        }
        public List<CongtacGV> listcongtacgiaovien()
        {
            return db.CongtacGVs.ToList();
        }
        public List<ChitietCTGV> listchitietcongtacgiaovien()
        {
            return db.ChitietCTGVs.ToList();
        }
        public CongtacGV timcongtacgiaovien(string id)
        {
            return db.CongtacGVs.Find(id);
        }
        public ChitietCTGV timchitietcongtacgiaovien(string id)
        {
            return db.ChitietCTGVs.Find(id);
        }
        public bool Themcongtacgiaovien(CongtacGV entity)
        {
            var check = db.CongtacGVs.Find(entity.MaCT);
            if (check != null) return false;
            db.CongtacGVs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool Themchitietcongtacgiaovien(ChitietCTGV entity)
        {
            var check = db.ChitietCTGVs.Find(entity.MaCTCTGV);
            if (check != null) return false;
            db.ChitietCTGVs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool Suacongtacgiaovien(CongtacGV entity)
        {
            var res = db.CongtacGVs.Find(entity.MaCT);
            res.TenCT = entity.TenCT;
            db.SaveChanges();
            return true;
        }
        public bool Suachitietcongtacgiaovien(ChitietCTGV entity)
        {
            var res = db.ChitietCTGVs.Find(entity.MaCTCTGV);
            res.MaCT = entity.MaCT;
            res.NgayCT = entity.NgayCT;
            res.Noidung = entity.Noidung;
            res.Thanhphan = entity.Thanhphan;
            res.Diadiem = entity.Diadiem;
            res.Chutri = entity.Chutri;
            res.Bosung = entity.Bosung;
            db.SaveChanges();
            return true;
        }
        public bool? changestatuscongtacgiaovien(string id)
        {
            var res = db.CongtacGVs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatuschitietcongtacgiaovien(string id)
        {
            var res = db.ChitietCTGVs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public IEnumerable<Trangthai> ITrangthai = new List<Trangthai>
        {
            new Trangthai
            {
                id = "False",
                flag = "Khóa"
            },
            new Trangthai
            {
                id = "True",
                flag = "Không khóa"
            }
        };
    }
}
