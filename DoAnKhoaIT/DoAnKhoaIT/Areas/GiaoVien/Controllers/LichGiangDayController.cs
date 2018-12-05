using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.GiaoVien;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class LichGiangDayController : Controller
    {
        // GET: GiaoVien/LichGiangDay
        LichGV dao = new LichGV();
        public ActionResult LichHop(string mact)
        {
            var res = dao.LoadALL(mact);
            ViewBag.Theongay = dao.LoadTheoNgay(mact);
            return View(res);
        }
        public ActionResult LichTrucTuan()
        {
            return View();
        }
    }
}