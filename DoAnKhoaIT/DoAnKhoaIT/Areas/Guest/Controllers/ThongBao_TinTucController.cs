using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class ThongBao_TinTucController : Controller
    {
        // GET: Guest/ThongBao_TinTuc
        ThongBao_TinTucDAO dao = new ThongBao_TinTucDAO();
        public ActionResult HB()
        {
            return View();
        }
        public ActionResult TTTD(string tagid,string ten,int page=1,int pagesize=5)
        {
            ViewBag.Ten = ten;
            ViewBag.TagID = tagid;
            var res = dao.ListALL(tagid, page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult CTTD(string mabd,string ten,string tagid)
        {
            ViewBag.TagID = tagid;
            ViewBag.Ten = ten;
            var res = dao.CTBD(mabd);
            return View(res);
        }
    }
}