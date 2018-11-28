using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class DaotaoDao
    {
        SGU db = null;
        public DaotaoDao()
        {
            db = new SGU();
        }
        public List<Loaidaotao> listloaidaotao()
        {
            return db.Loaidaotaos.ToList();
        }
        public List<NoidungDT> listnoidungdaotao()
        {
            return db.NoidungDTs.ToList();
        }
        public bool Themloaidaotao(Loaidaotao entity)
        {
            var check = db.Loaidaotaos.Find(entity.MaloaiDT);
            if (check != null) return false;
            db.Loaidaotaos.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool Themnoidungdaotao(NoidungDT entity)
        {
            var check = db.NoidungDTs.Find(entity.MaNDDT);
            if (check != null) return false;
            db.NoidungDTs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool Sualoaidaotao(Loaidaotao entity)
        {
            var res = db.Loaidaotaos.Find(entity.MaloaiDT);
            res.Tenloai = entity.Tenloai;
            db.SaveChanges();
            return true;
        }
        public bool Suanoidungdaotao(NoidungDT entity)
        {
            var res = db.NoidungDTs.Find(entity.MaNDDT);
            res.MaloaiDT = entity.MaloaiDT;
            res.Tieude = entity.Tieude;
            res.NoidungDT1 = entity.NoidungDT1;
            db.SaveChanges();
            return true;
        }
        public Loaidaotao timloaidaotao(string id)
        {
            return db.Loaidaotaos.Find(id);
        }
        public NoidungDT timnoidungdaotao(string id)
        {
            return db.NoidungDTs.Find(id);
        }
        public bool? changestatusloaidaotao(string id)
        {
            var res = db.Loaidaotaos.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? changestatusnoidungdaotao(string id)
        {
            var res = db.NoidungDTs.Find(id);
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
