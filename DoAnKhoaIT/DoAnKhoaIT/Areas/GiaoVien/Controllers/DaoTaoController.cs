using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
using DoAnKhoaIT.Controllers;

namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class DaoTaoController : BaseGiaovienController
    {
        // GET: GiaoVien/DaoTao
        public ActionResult DaoTao(string maloaidt, string tenloai, int page = 1, int pagesize = 5)
        {
            DaoTaoDAO dao = new DaoTaoDAO();
            ViewBag.TenLoai = tenloai;
            ViewBag.MaDT = maloaidt;
            var res = dao.LoadList(maloaidt, page, pagesize);
            if (res == null)
                return View(new NoidungDT());
            return View(res);
        }
        public ActionResult CT_DaoTao(string manddt, string tenloai, string madt)
        {
            DaoTaoDAO dao = new DaoTaoDAO();
            ViewBag.MaDT = madt;
            ViewBag.TenLoai = tenloai;
            ViewBag.HoTen = dao.GetTenTK(manddt);
            var res = dao.CTDT(manddt);
            return View(res);
        }
        public ActionResult DaoTaoALL(int page = 1, int pagesize = 5)
        {
            DaoTaoDAO dao = new DaoTaoDAO();           
            var res = dao.LoadListALL(page, pagesize);
            if (res == null)
                return View(new NoidungDT());
            return View(res);
        }

    }
}