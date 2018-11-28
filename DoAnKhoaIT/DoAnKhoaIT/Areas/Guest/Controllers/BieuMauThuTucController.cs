using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class BieuMauThuTucController : Controller
    {
        // GET: Guest/BieuMauThuTuc
        BMTTDAO dao = new BMTTDAO();
        public ActionResult BM(string mabm,string tenbm,int page=1,int pagesize=5)
        {
            ViewBag.Ten = tenbm;
            ViewBag.MaBM = mabm;
            var res = dao.ListALL(mabm, page, pagesize);
            if (res == null)
                return View(new NoidungBMTT());
            return View(res);
        }
        //public ActionResult QD()
        //{
        //    return View();
        //}
        //public ActionResult QT()
        //{
        //    return View();
        //}
        //public ActionResult KLTN()
        //{
        //    return View();
        //}
        public ActionResult CTBM(string mandbm,string tenbm,string mabm)
        {
            ViewBag.Ten = tenbm;
            ViewBag.MaBM = mabm;
            var res = dao.CTBD(mandbm);
            return View(res);
        }
    }
}