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
    public class ThongtinnguoidungDao
    {
        SGU db = null;
        public ThongtinnguoidungDao()
        {
            db = new SGU();
        }
        public List<Taikhoan> Listtaikhoan()
        {
            var res = db.Taikhoans.ToList();
            return res;
        }
        public List<Chucvu> Listchucvu()
        {
            return db.Chucvus.ToList();
        }
        public List<Quyennguoidung> Listquyen()
        {
            return db.Quyennguoidungs.ToList();
        }
        public bool Themtaikhoan(Taikhoan entity)
        {
            var x = db.Taikhoans.Find(entity.Tentaikhoan);
            entity.TGdangki = System.DateTime.Now;
            entity.Trangthaihd = "Offline";
            if (x != null) return false;
            var res = db.Taikhoans.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool Themthongtin(Thongtinnguoidung entity)
        {
            var res = db.Thongtinnguoidungs.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themchucvu(Chucvu entity)
        {
            var check = db.Chucvus.Find(entity.Machucvu);
            if (check != null)
            {
                return false;
            }
            var res = db.Chucvus.Add(entity);
            db.SaveChanges();
            return true;
        }
        public bool themquyen(Quyennguoidung entity)
        {
            var res = db.Quyennguoidungs.Add(entity);
            return true;
        }
        public bool themchitietquyen(string machucvu, string maquyen)
        {
            Chitietquyen t = new Chitietquyen();
            t.Maquyen = maquyen;
            t.Machucvu = machucvu;
            t.Flag = true;
            var res = db.Chitietquyens.Add(t);
            db.SaveChanges();
            return true;
        }
        public Taikhoan timtaikhoan(string tentaikhoan)
        {
            return db.Taikhoans.Find(tentaikhoan);
        }
        public Chucvu timchucvu(string id)
        {
            return db.Chucvus.Find(id);
        }
        public Thongtinnguoidung timthongtin(string tentaikhoan)
        {
            var res = db.Thongtinnguoidungs.Where(Model => Model.Tentaikhoan == tentaikhoan);
            return res.SingleOrDefault();
        }
        public bool Suataikhoan(Taikhoan entity)
        {
            var res = db.Taikhoans.Find(entity.Tentaikhoan);
            if (res != null)
            {
                res.Matkhau = entity.Matkhau;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool suathongtin(string id, Thongtinnguoidung entity)
        {
            var res = db.Thongtinnguoidungs.Where(model => model.Tentaikhoan == id).SingleOrDefault();
            res.Hoten = entity.Hoten;
            res.Namsinh = entity.Namsinh;
            res.Sodienthoai = entity.Sodienthoai;
            res.Quequan = entity.Quequan;
            db.SaveChanges();
            return true;

        }
        public bool suachucvu(Chucvu entity)
        {
            var res = db.Chucvus.Find(entity.Machucvu);
            res.Tenchucvu = entity.Tenchucvu;
            return true;
        }
        public IEnumerable<Chucvu> Ichucvu()
        {
            var res = db.Chucvus;
            return res;
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
        public bool? changeStatusTaikhoan(string id)
        {
            var taikhoan = db.Taikhoans.Find(id);
            taikhoan.Flag = !taikhoan.Flag;
            db.SaveChanges();
            return !taikhoan.Flag;
        }
        public bool? changeStatusChucvu(string id)
        {
            var chucvu = db.Chucvus.Find(id);
            chucvu.Flag = !chucvu.Flag;
            db.SaveChanges();
            return !chucvu.Flag;
        }
        public List<Chitietquyen> timlistquyen(string id)
        {
            var res = db.Chitietquyens.Where(model => model.Machucvu == id).ToList();
            return res;
        }
        public bool xoachitietquyen(string id)
        {
            object[] sqlParams =
                        {
                new SqlParameter("@machucvu",id)
            };
            var res =
                db.Database.ExecuteSqlCommand("delete from chitietquyen where machucvu = @machucvu", sqlParams);
            return true;
        }
    }
}
