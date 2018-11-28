using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class OlympicSVController : Controller
    {
        // GET: Guest/OlympicSV
        OlympicDAO dao = new OlympicDAO();
        public ActionResult OLPSV(int page=1,int pagesize=5)
        {
            var res = dao.ListOlympic(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult OLPSV1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }
    }
}