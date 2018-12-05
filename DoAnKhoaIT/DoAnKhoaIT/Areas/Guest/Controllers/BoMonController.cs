using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class BoMonController : Controller
    {
        // GET: Guest/BoMon
        SGU db = new SGU();
        BoMonDAO dao = new BoMonDAO();
        public ActionResult HTTT(string mabm,string tenbm)
        {
            var res = dao.LoadBM(mabm);
            ViewBag.SLTS = dao.SLTiensi(mabm);
            ViewBag.ListGV = dao.ThongtinGV(mabm);
            ViewBag.ListMH = dao.ListMH(mabm);
            ViewBag.TenBM = tenbm;
            ViewBag.SLThacsi = dao.SLThacsi(mabm);
            ViewBag.List = db.Bomons.Where(s => s.Flag == true).ToList();
            if (res == null)
                return View(new Bomon());
            return View(res);
        }
        //public ActionResult KTPM()
        //{
        //    return View();
        //}
        //public ActionResult KHMT()
        //{
        //    return View();
        //}
        //public ActionResult MMT()
        //{
        //    return View();
        //}
    }
}