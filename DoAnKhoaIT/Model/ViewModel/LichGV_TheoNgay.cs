using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.ViewModel
{
    public class LichGV_TheoNgay
    {
        public DateTime? Ngay { get; set; }
        public ChitietCTGV ctgv { get; set; }
        public string thu { get; set; }
        public string thoigian { get; set; }
    }
}
