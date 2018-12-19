using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.GiaoVien;
using DoAnKhoaIT.Controllers;

namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class TinTucController : BaseGiaovienController    
    {
        // GET: GiaoVien/TinTuc
        TinTucDAO dao = new TinTucDAO();
        public ActionResult TinTuc(int page=1,int pagesize=5)
        {
            var res = dao.ListTT(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult CTTinTuc(string mabaidang)
        {
            var res = dao.CTBDTT(mabaidang);           
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
    }
}