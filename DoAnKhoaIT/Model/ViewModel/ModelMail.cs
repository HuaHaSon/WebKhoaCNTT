using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
namespace Model.ViewModel
{
    public class ModelMail
    {
        public int mact { get; set; }
        public string tentknhan { get; set; }
        public DateTime? ngaynhan { get; set; }
        public DateTime? ngaychuyen { get; set; }
        public string noidung { get; set; }
        public string trangthaixem { get; set; }
        public string trangthaichuyen { get; set; }
        public string tieude { get; set; }
        public string tentkgui { get; set; }
        public int? flag { get; set; }
    }
}
