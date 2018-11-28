using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class CongtacgiaovienModel
    {
        public List<CongtacGV> listcongtacgiaovien { set; get; }
        public List<ChitietCTGV> listchitietcongtacgiaovien { set; get; }
        public CongtacGV congtacgiaovien { set; get; }
        public ChitietCTGV chitietcongtacgiaovien { set; get; }
    }
}
