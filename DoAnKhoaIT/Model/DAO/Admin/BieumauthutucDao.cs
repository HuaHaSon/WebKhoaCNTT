using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class BieumauthutucDao
    {
        SGU db = null;
        public BieumauthutucDao()
        {
            db = new SGU();
        }
        public Bieumauthutuc timbieumau(string id)
        {
            return db.Bieumauthutucs.Find(id);
        }
        public NoidungBMTT timnoidungbieumau(string id)
        {
            return db.NoidungBMTTs.Find(id);
        }
        public List<Bieumauthutuc> listbieumauthutuc()
        {
            return db.Bieumauthutucs.ToList();
        }
        public List<NoidungBMTT> listnoidungbieumauthutuc()
        {
            return db.NoidungBMTTs.ToList();
        }
        public bool Thembieumau(Bieumauthutuc entity)
        {
            var check = db.Bieumauthutucs.Find(entity.MaBMTT);
            if (check != null) return false;
            db.Bieumauthutucs.Add(entity);
            db.SaveChanges();
            return true;

        }
        public bool Themnoidungbieumau(NoidungBMTT entity)
        {
            var check = db.NoidungBMTTs.Find(entity.MaNDBMTT);
            if (check != null) return false;
            db.NoidungBMTTs.Add(entity);
            db.SaveChanges();
            return true;

        }
        public bool Suabieumau(Bieumauthutuc entity)
        {
            var res = db.Bieumauthutucs.Find(entity.MaBMTT);
            res.TenBMTT = entity.TenBMTT;
            db.SaveChanges();
            return true;
        }
        public bool Suanoidungbieumau(NoidungBMTT entity)
        {
            var res = db.NoidungBMTTs.Find(entity.MaNDBMTT);
            res.MaBMTT = entity.MaBMTT;
            res.Tieude = entity.Tieude;
            res.NoidungBMTT1 = entity.NoidungBMTT1;
            db.SaveChanges();
            return true;
        }
        public bool? changestatusbieumau(string id)
        {
            var res = db.Bieumauthutucs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatusnoidungbieumau(string id)
        {
            var res = db.NoidungBMTTs.Find(id);
            res.flag = !res.flag;
            db.SaveChanges();
            return !res.flag;
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
