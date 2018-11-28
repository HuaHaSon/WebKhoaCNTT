using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ThongtinnguoidungModel
    {
        public List<Taikhoan> listtaikhoan { set; get; }
        public Taikhoan taikhoan { set; get; }
        public Chucvu chucvu { set; get; }
        public List<Chucvu> listchucvu { set; get; }
        public Thongtinnguoidung thongtinnguoidung { set; get; }
        public List<Quyennguoidung> listquyen { set; get; }
        public Quyennguoidung quyennguoidung { set; get; }
        public bool[] quyen { set; get; }
    }
}
