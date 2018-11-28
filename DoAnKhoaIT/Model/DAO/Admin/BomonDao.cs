using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class BomonDao
    {
        SGU db = null;
        public BomonDao()
        {
            db = new SGU();
        }
        public List<Bomon> listbomon()
        {
            return db.Bomons.ToList();
        }
        public List<Monhoc> listmonhoc()
        {
            return db.Monhocs.ToList();
        }
        public List<ThongtinGV> listgiaovien()
        {
            return db.ThongtinGVs.ToList();
        }
        public Bomon timbomon(string id)
        {
            return db.Bomons.Find(id);
        }
        public Monhoc timmonhoc(string id)
        {
            return db.Monhocs.Find(id);
        }
        public ThongtinGV timgiaovien(string id)
        {
            return db.ThongtinGVs.Find(id);
        }
        public bool thembomon(Bomon entity)
        {
            var check = db.Bomons.Find(entity.MaBM);
            if (check != null) return false;
            db.Bomons.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themmonhoc(Monhoc entity)
        {
            var check = db.Monhocs.Find(entity.MaMH);
            if (check != null) return false;
            db.Monhocs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themgiaovien(ThongtinGV entity)
        {
            var check = db.ThongtinGVs.Find(entity.MaGV);
            if (check != null) return false;
            db.ThongtinGVs.Add(entity);
            db.SaveChanges();
            return true;           
        }
        public bool suabomon(Bomon entity)
        {
            var res = db.Bomons.Find(entity.MaBM);
            res.TenBM = entity.TenBM;
            res.Noidung = entity.Noidung;
            db.SaveChanges();
            return true;
        }
        public bool suagiaovien(ThongtinGV entity)
        {
            var res = db.ThongtinGVs.Find(entity.MaGV);
            res.MaBM = entity.MaBM;
            res.TenGV = entity.TenGV;
            res.Chucvu = entity.Chucvu;
            res.Chucdanh = entity.Chucdanh;
            res.ThongtinGV1 = entity.ThongtinGV1;
            res.Diachimail = entity.Diachimail;
            db.SaveChanges();
            return true;
        }
        public bool suamonhoc(Monhoc entity)
        {
            var res = db.Monhocs.Find(entity.MaMH);
            res.TenMH = entity.TenMH;
            res.MaBM = entity.MaBM;
            db.SaveChanges();
            return true;
        }
        public bool? changestatusbomon(string id)
        {
            var res = db.Bomons.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatusmonhoc(string id)
        {
            var res = db.Monhocs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatusgiaovien(string id)
        {
            var res = db.ThongtinGVs.Find(id);
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
