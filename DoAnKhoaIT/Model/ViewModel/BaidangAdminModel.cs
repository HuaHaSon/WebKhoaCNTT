using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class BaidangAdminModel
    {
        public List<Baidang> listbaidang { set; get; }
        public List<Loaibaidang> listloaibaidang { set; get; }
        public List<Chucvu> listchucvu { set; get; }
        public List<Chucvu> listchucvudangbai { set; get; }
        public List<Tag> listagdangbai { set; get; }
        public List<Tag> listag { set; get; }
        public Baidang baidang { set; get; }
        public Loaibaidang loaibaidang { set; get; }
        public Tag tag { set; get; }
    }
}
