using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class LichGiaoVienModel
    {
        public List<List<ChitietCTGV>> listchitietcongtac { set; get; }
        public DateTime ngay { get; set; }
    }
}
