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
        public string thu { get; set; }
        public string thoigian { get; set; }
        public string Thanhphan { get; set; }
        public string Diadiem { get; set; }
        public string ChuTri { get; set; }
        public string Noidung { get; set; }
        public List<ChitietCTGV> ctgv { get; set; }

    }
}
