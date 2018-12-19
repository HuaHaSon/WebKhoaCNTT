using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaIT.Controllers;
using Model.DAO.GiaoVien;
using Model.EF;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class SuKienController : BaseGiaovienController
    {
        // GET: GiaoVien/SuKien
        SuKien dao = new SuKien();
        public ActionResult SK(int page=1,int pagesize=5)
        {
            var res = dao.ListSK(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult SK1(string mabaidang)
        {
            var res = dao.CTBD(mabaidang);
            return View(res);
        }
    }
}