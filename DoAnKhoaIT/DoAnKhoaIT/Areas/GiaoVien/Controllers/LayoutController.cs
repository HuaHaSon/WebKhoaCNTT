using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class LayoutController : Controller
    {
        // GET: GiaoVien/Layout
        SGU db = new SGU();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TTC(string tieude)
        {
            ViewBag.List = db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "TTC").ToList();
            return PartialView("Gioithieu_TTC");
        }
        public ActionResult CCTC(string tieude)
        {
            ViewBag.List = db.NoidungGTs.Where(s => s.Flag == true && s.MaGT == "CCTC").ToList();
            return PartialView("Gioithieu_CCTC");
        }
        public ActionResult LoaiDaoTao()
        {
            ViewBag.List = db.Loaidaotaos.Where(s => s.Flag == true && s.MaloaiDT!="DH").ToList();
            return PartialView("Loaidaotao");
        }
        public ActionResult BoMon()
        {
            ViewBag.List = db.Bomons.Where(s => s.Flag == true).ToList();
            return PartialView("BoMon");
        }
        public ActionResult NCKH()
        {
            ViewBag.List = db.NghiencuuKHs.Where(s => s.Flag == true).ToList();
            return PartialView("NCKH");
        }
        public ActionResult CongTacSV()
        {
            ViewBag.List = db.Bieumauthutucs.Where(s => s.Flag == true).ToList();
            return PartialView("BMTT");
        }
        public ActionResult LoadLoaiBD()
        {
            ViewBag.List = db.Loaibaidangs.Where(s => s.Flag == true && s.Maloai!="HDSV" && s.Maloai!="TS").Select(s => s.Tenloai).ToList();
            return PartialView("LoadLoaiBD");
        }
        public ActionResult LichGV()
        {
            ViewBag.List = db.CongtacGVs.Where(s => s.Flag == true).ToList();
            return PartialView("LichGV");
        }
    }
}