using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class NghiencuukhoahocDao
    {
        SGU db = null;
        public NghiencuukhoahocDao()
        {
            db = new SGU();
        }
        public List<NghiencuuKH> listnghiencuukhoahoc()
        {
            return db.NghiencuuKHs.ToList();
        }
        public List<ChitietNCKH> listchitietnghiencuukhoahoc()
        {
            return db.ChitietNCKHs.ToList();

        }
        public NghiencuuKH timnghiencuukhoahoc(string id)
        {
            return db.NghiencuuKHs.Find(id);
        }
        public ChitietNCKH timchitietnghiencuukhoahoc(string id)
        {
            return db.ChitietNCKHs.Find(id);
        }
        public bool themnghiencuukhoahoc(NghiencuuKH entity)
        {
            var check = db.NghiencuuKHs.Find(entity.MaNCKH);
            if (check != null) return false;
            db.NghiencuuKHs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themchitietnghiencuukhoahoc(ChitietNCKH entity)
        {
            var check = db.ChitietNCKHs.Find(entity.MaCTNCKH);
            if (check != null) return false;
            db.ChitietNCKHs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool suanghiencuukhoahoc(NghiencuuKH entity)
        {
            var res = db.NghiencuuKHs.Find(entity.MaNCKH);
            res.TenNCKH = entity.TenNCKH;
            db.SaveChanges();
            return true;
        }
        public bool suachitietnghiencuukhoahoc(ChitietNCKH entity)
        {
            var res = db.ChitietNCKHs.Find(entity.MaCTNCKH);
            res.MaNCKH = entity.MaNCKH;
            res.Tieude = entity.Tieude;
            res.Noidung = entity.Noidung;
            res.NgaySK = entity.NgaySK;
            db.SaveChanges();
            return true;
        }
        public bool? changestatusnghiencuukhoahoc(string id)
        {
            var res = db.NghiencuuKHs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatuschitietnghiencuukhoahoc(string id)
        {
            var res = db.ChitietNCKHs.Find(id);
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
