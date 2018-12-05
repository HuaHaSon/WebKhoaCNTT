using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class BoMonController : Controller
    {
        BoMonDAO dao = new BoMonDAO();
        // GET: GiaoVien/BoMon
        public ActionResult NDBoMon(string mabm, string tenbm)
        {
            var res = dao.LoadBM(mabm);
            ViewBag.SLTS = dao.SLTiensi(mabm);
            ViewBag.ListGV = dao.ThongtinGV(mabm);
            ViewBag.ListMH = dao.ListMH(mabm);
            ViewBag.TenBM = tenbm;
            ViewBag.SLThacsi = dao.SLThacsi(mabm);
            if (res == null)
                return View(new Bomon());
            return View(res);
        }
    }
}