using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class HomeController : Controller
    {
        // GET: GiaoVien/Home
        public ActionResult IndexGV()
        {
            return View();
        }
    }
}