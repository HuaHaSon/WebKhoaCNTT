using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class SuKienController : Controller
    {
        // GET: Guest/SuKien
        SuKien dao = new SuKien();
        public ActionResult SK(int page=1,int pagesize=5)
        {
            var res = dao.ListSK(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult SuKien1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }

    }
}