using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BieumauthutucModel
    {

        public List<Bieumauthutuc> listbieumauthutuc { set; get; }
        public List<NoidungBMTT> listnoidungbieumauthutuc { set; get; }
        public Bieumauthutuc bieumauthutuc { set; get; }
        public NoidungBMTT noidungbieumauthutuc { set; get; }
        
    }
}
