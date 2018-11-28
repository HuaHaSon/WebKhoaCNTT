using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class LayoutController : Controller
    {
        SGU db = new SGU();
        // GET: Guest/Layout
        public ActionResult Gioithieu1()
        {
            ViewBag.List = db.NoidungGTs.Where(s => s.MaGT == "CCTC").Select(s => s.Tieude).ToList();
            return PartialView("Gioithieu1");
        }
        public ActionResult LoadLoaiBD()
        {
            ViewBag.List = db.Loaibaidangs.Where(s => s.Flag==true).Select(s=>s.Tenloai).ToList();
            return PartialView("LoadLoaiBD");
        }
        public ActionResult DaoTao()
        {
            ViewBag.List = db.Loaidaotaos.Where(s => s.Flag == true).ToList();
            return PartialView("DaoTao");
        }
        public ActionResult BoMon()
        {
            ViewBag.List = db.Bomons.Where(s => s.Flag == true).ToList();
            return PartialView("BoMon");
        }
        public ActionResult CongTacSV()
        {
            ViewBag.List = db.Bieumauthutucs.Where(s => s.Flag == true).ToList();
            return PartialView("BMTT");
        }
    }
}