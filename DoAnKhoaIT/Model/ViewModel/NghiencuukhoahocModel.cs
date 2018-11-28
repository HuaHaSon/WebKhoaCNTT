using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class NghiencuukhoahocModel
    {
        public List<NghiencuuKH> listnghiencuukhoahoc { set; get; }
        public List<ChitietNCKH> listchitietnghiencuukhoahoc { set; get; }
        public NghiencuuKH nghiencuukhoahoc { set; get; }
        public ChitietNCKH chitietnghiencuukhoahoc { set; get; }
    }
}
