using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class HoatDongDoanHoiController : Controller
    {
        // GET: Guest/HoatDongDoanHoi
        HDDHDAO dao = new HDDHDAO();
        public ActionResult HDDH(int page=1,int pagesize=5)
        {
            var res = dao.ListHDDH(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult HDDH1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }
    }
}