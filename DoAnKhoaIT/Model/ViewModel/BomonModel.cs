using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BomonModel
    {
        public List<Bomon> listbomon { set; get; }
        public List<Monhoc> listmonhoc { set; get; }
        public List<ThongtinGV> listgiaovien { set; get; }
        public Bomon bomon { set; get; }
        public Monhoc monhoc { set; get; }
        public ThongtinGV giaovien { set; get; }

    }
}
