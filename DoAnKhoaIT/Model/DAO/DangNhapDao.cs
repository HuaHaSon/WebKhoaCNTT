using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class DangNhapDao
    {
        SGU db = null;
        public DangNhapDao()
        {
            db = new SGU();
        }
        public int login(string UserName, string Password)
        {
            var result = db.Taikhoans.SingleOrDefault(x => x.Tentaikhoan == UserName);
            if (result == null) return -1;
            else
                if (result.Matkhau == Password && result.Flag.GetValueOrDefault())
            {

                return 1;
            }
            else
                if (!result.Flag.GetValueOrDefault()) return 2;
            else
                return 0;
        }

        public Thongtinnguoidung GetById(string UserName)
        {
            return db.Thongtinnguoidungs.SingleOrDefault(x => x.Tentaikhoan == UserName);
        }
    }
}
