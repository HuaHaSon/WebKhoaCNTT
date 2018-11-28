using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class CauLacBoSVController : Controller
    {
        // GET: Guest/CauLacBoSV
        CLBSVDAO dao = new CLBSVDAO();
        public ActionResult CLBSV(int page=1,int pagesize=5)
        {
            var res = dao.ListCLBSV(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult CLBSV1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }
    }
}