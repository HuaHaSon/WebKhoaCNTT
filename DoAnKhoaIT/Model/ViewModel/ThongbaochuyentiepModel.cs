using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ThongbaochuyentiepModel
    {
        public List<Thongbaochuyentiep> listthongbaochuyentiep { set; get; }
        public List<Taikhoan> listtaikhoan { set; get; }
        public Thongbaochuyentiep thongbaochuyentiep { set; get; }
        public Chitietchuyentiep chitietchuyentiep { set; get; }
    }
}
