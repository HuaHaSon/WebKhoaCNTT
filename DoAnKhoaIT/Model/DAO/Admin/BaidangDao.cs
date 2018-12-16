using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO.Admin
{
    public class BaidangDao
    {
        SGU db = null;
        public BaidangDao()
        {
            db = new SGU();
        }
        // bai dang
        public List<Baidang> listbaidang()
        {
            return db.Baidangs.ToList();
        }
        public int[] thongkebaidangtheongay(DateTime startdate, DateTime enddate)
        {
            var d1 = startdate;
            var d2 = enddate;
            int soluong = Convert.ToInt32((d2 - d1).TotalDays);
            int[] a = new int[soluong+1];
            int i = 0;
            while(DateTime.Compare(d1,d2) < 0)
            {
                var t = d1.AddDays(1);
                a[i] = db.Baidangs.Where(model => model.Ngaydang >= d1 && model.Ngaydang < t).Count();
                i++;
                d1 = t;
            }
            return a;
        }
        public List<Loaibaidang> listloaibaidang()
        {
            return db.Loaibaidangs.ToList();
        }
        public List<Chucvu> listchucvu()
        {
            return db.Chucvus.ToList();

        }
        public List<Tag> listtag()
        {
            return db.Tags.ToList();
        }
        public List<Chucvu> listchucvudangbai()
        {
            var res = db.Database.SqlQuery<Chucvu>("select distinct tenchucvu,tag.machucvu,chucvu.flag from chucvu,tag where tag.Machucvu = Chucvu.Machucvu").ToList();
            return res;
        }
        public List<Tag> listtagdangbai(string machucvu)
        {
            return db.Tags.Where(model => model.Machucvu == machucvu).ToList();
        }
        public bool thembaidang(Baidang entity)
        {
            var check = db.Baidangs.Find(entity.Mabaidang);
            if (check != null) return false;
            var res = db.Baidangs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themloaibaidang(Loaibaidang entity)
        {
            var check = db.Loaibaidangs.Find(entity.Maloai);
            if (check != null) return false;
            db.Loaibaidangs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themtagid(Tag entity)
        {
            var check = db.Tags.Where(model => model.TenTag == entity.TenTag).SingleOrDefault();
            if (check != null) return false;
            entity.TagID = (db.Tags.Count() + 1).ToString();
            db.Tags.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool suabaidang(Baidang entity)
        {
            var check = db.Baidangs.Find(entity.Mabaidang);
            if (check == null) return false;
            check.Maloai = entity.Maloai;
            check.Thoigianhieuluc = entity.Thoigianhieuluc;
            check.Tieude = entity.Tieude;
            check.Noidung = entity.Noidung;
            check.ĐoituongHT = entity.ĐoituongHT;
            db.SaveChanges();
            return true;
        }
        public bool sualoaibaidang(Loaibaidang entity)
        {
            var res = db.Loaibaidangs.Find(entity.Maloai);
            res.Tenloai = entity.Tenloai;
            db.SaveChanges();
            return true;
        }
        public bool suatagid(Tag entity)
        {
            var res = db.Tags.Find(entity.TagID);
            var check = db.Tags.Where(model => model.TenTag == entity.TenTag);
            if (res.TenTag != entity.TenTag) return false;
            res.TenTag = entity.TenTag;
            res.Machucvu = entity.Machucvu;
            return true;
            
        }
        public bool? ChangeStatusbaidang(string id)
        {
            var res = db.Baidangs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? ChangeStatusloaibaidang(string id)
        {
            var res = db.Loaibaidangs.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public bool? ChangeStatustagid(string id)
        {
            var res = db.Tags.Find(id);
            res.Flag = !res.Flag;
            db.SaveChanges();
            return !res.Flag;
        }
        public Tag timtagbyid(string id)
        {
            return db.Tags.Find(id);
        }
        public Baidang timbaidang(string id)
        {
            return db.Baidangs.Find(id);
        }
        public Loaibaidang timloaibaidang(string id)
        {
            return db.Loaibaidangs.Find(id);
        }
        public  bool themchitietbaidang(string id, string mabaidang)
        {
            Chitietbaidang ctbd = new Chitietbaidang
            {
                Mabaidang =mabaidang,
                TagID = id,
                Flag = true
            };
            var res = db.Chitietbaidangs.Add(ctbd);
            db.SaveChanges();
            return true;
        }
        public List<Chitietbaidang> timchitietbaidang(string mabaidang)
        {
            return db.Chitietbaidangs.Where(model => model.Mabaidang == mabaidang).ToList();
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
        public IEnumerable<Doituonghienthi> IHienthi = new List<Doituonghienthi>
        {
            new Doituonghienthi
            {
                 id = "SV",
                 ten = "Sinh viên"
            },
            new Doituonghienthi
            {
                id= "GV",
                ten = "Giáo viên"
            },
            new Doituonghienthi
            {
                id = "ALL",
                ten = "Tất cả"
            }
        };
        public bool xoachitietbaidang(string mabaidang) {
            object[] sqlParams =
           {
                new SqlParameter("@mabaidang",mabaidang)
            };
            var res =
                db.Database.ExecuteSqlCommand("delete from chitietbaidang where mabaidang = @mabaidang", sqlParams);
            return true;
        }
        public bool checkbaidang(DateTime day)
        {
            var res = db.Baidangs.Where(model => model.Thoigianhieuluc < day && model.Flag == true).ToList();
            if(res.Count>0)
            {
                foreach (var item in res)
                {
                    item.Flag = false;
                }
                db.SaveChanges();
                return true;
            }
            return false;
        }

    }
}
