using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class GioithieuDao
    {
        SGU db = null;
        public GioithieuDao()
        {
            db = new SGU();
        }
        public List<LoaiGT> listloaigioithieu()
        {
            return db.LoaiGTs.ToList();

        }
        public List<NoidungGT> listnoidunggioithieu()
        {
            return db.NoidungGTs.ToList();
        }
        public LoaiGT timloaigioithieu(string id)
        {
            return db.LoaiGTs.Find(id);
        }
        public NoidungGT timnoidunggioithieu(string id)
        {
            return db.NoidungGTs.Find(id);
        }
        public NoidungGT noidunggioithieu(string id)
        {
            return db.NoidungGTs.Find(id);
        }
        public bool themloaigioithieu(LoaiGT entity)
        {
            var check = db.LoaiGTs.Find(entity.MaGT);
            if (check != null) return false;
            db.LoaiGTs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themnoidunggioithieu(NoidungGT entity)
        {
            var check = db.NoidungGTs.Find(entity.MaNDGT);
            if (check != null) return false;
            db.NoidungGTs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool sualoaigioithieu(LoaiGT entity)
        {
            var check = db.LoaiGTs.Find(entity.MaGT);
            check.TenGT = entity.TenGT;
            db.SaveChanges();
            return true;
        }
        public bool suanoidunggioithieu(NoidungGT entity)
        {
            var check = db.NoidungGTs.Find(entity.MaNDGT);
            check.MaGT = entity.MaGT;
            check.Tieude = entity.Tieude;
            check.Noidung = entity.Noidung;
            db.SaveChanges();
            return true;
        }
        public bool? ChangeStatusLoaigioithieu(string id)
        {
            var res = db.LoaiGTs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? ChangeStatusNoidunggioithieu(string id)
        {
            var res = db.NoidungGTs.Find(id);
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
