using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class GioithieuModel
    {
        public List<LoaiGT> listloaigioithieu { set; get; }
        public List<NoidungGT> listnoidunggioithieu { set; get; }
        public LoaiGT loaigioithieu { set; get; }
        public NoidungGT noidunggioithieu { set; get; }
    }
}
