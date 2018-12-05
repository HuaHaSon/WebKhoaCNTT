using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class GioiThieuController : Controller
    {
        // GET: Guest/GioiThieu
        SGU db = new SGU();
        GioiThieuDAO dao = new GioiThieuDAO();
        public ActionResult TTC_GTC(string tieude)
        {
            var res = dao.LoadGTC(tieude);
            ViewBag.List1 = db.NoidungGTs.Where(s => s.Flag == true && s.MaGT=="TTC").Select(s => s.Tieude).ToList();
            ViewBag.List2= db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "CCTC").Select(s => s.Tieude).ToList();
            if (res == null)
                return View(new NoidungGT());
            return View(res);
        }
        //public ActionResult TTC_GTCSVC()
        //{
        //    return View();
        //}
        public ActionResult CCTC_ChiBo(string tieude)
        {
            var res = dao.LoadCCTC(tieude);
            ViewBag.List1 = db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "TTC").Select(s => s.Tieude).ToList();
            ViewBag.List2 = db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "CCTC").Select(s => s.Tieude).ToList();
            if (res == null)
                return View(new NoidungGT());
            return View(res);
        }
        //public ActionResult CCTC_BCNK()
        //{
        //    return View();
        //}
        //public ActionResult CCTC_HDKH()
        //{
        //    return View();
        //}
        //public ActionResult CCTC_CongDoan()
        //{
        //    return View();
        //}
        //public ActionResult CCTC_VPK()
        //{
        //    return View();
        //}
        //public ActionResult CCTC_CVCK()
        //{
        //    return View();
        //}
    }
}