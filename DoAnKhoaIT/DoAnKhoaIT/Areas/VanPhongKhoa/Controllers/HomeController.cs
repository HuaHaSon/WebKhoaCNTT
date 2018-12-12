using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class HomeController : Controller
    {
        // GET: VanPhongKhoa/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}