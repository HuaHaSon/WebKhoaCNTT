using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.GiaoVien;
using Model.EF;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class ThongBaoController : Controller
    {
        // GET: GiaoVien/ThongBao
        public ActionResult TB(string txtsearch, string tieude, string noidung, string loaibd, DateTime? tungay, DateTime? denngay, int page = 1, int pagesize = 5)
        {
            ThongBaoDAO dao = new ThongBaoDAO();
            var res = dao.ListALL(page, pagesize, txtsearch, tungay, denngay, tieude, noidung, loaibd);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult TB1(string mabaidang)
        {
            ThongBaoDAO dao = new ThongBaoDAO();
            var res = dao.CTBD(mabaidang);
            //ViewBag.List = db.Files.Where(s => s.Flag == true && s.Mabaidang==mabaidang).ToList();
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
    }
}