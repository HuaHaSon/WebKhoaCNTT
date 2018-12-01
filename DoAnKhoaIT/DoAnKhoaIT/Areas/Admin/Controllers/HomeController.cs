using DoAnKhoaIT.Controllers;
using Model.DAO.Admin;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult loadlichGV(string status)
        {
            CongtacgiaovienDao dao = new CongtacgiaovienDao();
            var list = dao.listchitietcongtacgiaovien();
            List<ChitietCTGV> res = new List<ChitietCTGV>();
            foreach (var item in list)
            {
                res.Add(new ChitietCTGV
                {
                    MaCTCTGV = item.MaCTCTGV,
                    Diadiem = item.Diadiem
                });
            }
            return Json(new
            {
                res
            });
        }
    }
}