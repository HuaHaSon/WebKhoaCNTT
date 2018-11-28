using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class DaotaoModel
    {
        public List<Loaidaotao> listloaidaotao { set; get; }
        public List<NoidungDT> listnoidungdaotao { set; get; }
        public Loaidaotao loaidaotao { set; get; }
        public NoidungDT noidungdaotao { set; get; }
    }
}
