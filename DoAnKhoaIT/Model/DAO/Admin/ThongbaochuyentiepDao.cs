using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class ThongbaochuyentiepDao
    {
        SGU db = null;
        public ThongbaochuyentiepDao()
        {
            db = new SGU();
        }
        public List<Thongbaochuyentiep> listthongbaochuyentiep()
        {
            return db.Thongbaochuyentieps.ToList();
        }
        public List<Taikhoan> listtaikhoan()
        {
            return db.Taikhoans.ToList();
        }
        public Thongbaochuyentiep timchuyentiep(string id)
        {
            return db.Thongbaochuyentieps.Find(id);
        }
        public Chitietchuyentiep timchitietchuyentiep(string id)
        {
            return db.Chitietchuyentieps.Where(model => model.Machuyentiep == id).SingleOrDefault()
;
        }
        public bool suathongbaochuyentiep(Thongbaochuyentiep entity)
        {
            var res = db.Thongbaochuyentieps.Find(entity.Machuyentiep);
            res.Tieude = entity.Tieude;
            res.Noidung = entity.Noidung;
            db.SaveChanges();
            return true;
        }
        public bool suachitietchuyentiep(Chitietchuyentiep entity)
        {
            var res = db.Chitietchuyentieps.Where(model => model.Machuyentiep == entity.Machuyentiep).SingleOrDefault();
            res.Taikhoannhan = entity.Taikhoannhan;
            db.SaveChanges();
            return true;
        }
        public bool themthongbaochuyentiep(Thongbaochuyentiep entity)
        {
            var check = db.Thongbaochuyentieps.Find(entity.Machuyentiep);
            if (check != null) return false;
            db.Thongbaochuyentieps.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themchitietchuyentiep(Chitietchuyentiep entity)
        {
            var res = db.Chitietchuyentieps.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool? ChangeStatusChuyentiep(string id)
        {
            var res = db.Thongbaochuyentieps.Find(id);
            res.Flag = !res.Flag;
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
