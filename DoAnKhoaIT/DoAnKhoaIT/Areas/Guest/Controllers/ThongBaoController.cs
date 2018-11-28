using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class ThongBaoController : Controller
    {
        // GET: Guest/ThongBao
        public ActionResult TB(string txtsearch, string tieude, string noidung, string loaibd, DateTime? tungay, DateTime? denngay, int page = 1, int pagesize=5)
        {
            ThongBaoDAO dao = new ThongBaoDAO();
            var res = dao.ListALL(page, pagesize, txtsearch,tungay,denngay,tieude,noidung,loaibd);
            if(res==null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult ThongBao1()
        {
            return View();
        }
    }
}