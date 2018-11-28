using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class TinTucController : Controller
    {
        SGU db = new SGU();
        // GET: Guest/TinTuc
        TinTucDAO dao = new TinTucDAO();
        public ActionResult TT(int page=1,int pagesize=5)
        {
            var res = dao.ListTT(page, pagesize);
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        public ActionResult TinTuc1(string mabaidang)
        {
            var res = dao.CTBDTT(mabaidang);
            //ViewBag.List = db.Files.Where(s => s.Flag == true && s.Mabaidang == mabaidang).ToList();
            if (res == null)
                return View(new Baidang());
            return View(res);
        }
        //public FileResult Dowload(string filepath)
        //{
        //    string contentType = string.Empty;
        //    if (filepath.Contains(".pdf"))
        //    {
        //        contentType = "application/pdf";
        //    }
        //    else if (filepath.Contains(".docx"))
        //    {
        //        contentType = "application/docx";
        //    }
        //    else if (filepath.Contains(".xlsx"))
        //    {
        //        contentType = "application/xlsx";
        //    }
        //    return File(filepath, contentType, filepath);
        //}
    }
}