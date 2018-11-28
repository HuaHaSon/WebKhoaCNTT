using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class ThongTinTuyenSinhController : Controller
    {
        // GET: Guest/ThongTinTuyenSinh
        ThongTinTSDAO dao = new ThongTinTSDAO();
        public ActionResult TTTS(int page=1,int pagesize=5)
        {
            var res = dao.ListTS(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult TuyenSinh1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }
    }
}