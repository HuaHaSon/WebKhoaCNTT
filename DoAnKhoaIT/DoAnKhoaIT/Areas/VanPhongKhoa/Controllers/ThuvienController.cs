using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class ThuvienController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Thuvien
        public ActionResult Index()
        {
            return View();
        }
    }
}