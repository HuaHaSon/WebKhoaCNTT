using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class HuongdanController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Huongdan
        public ActionResult Index()
        {
            return View();
        }
    }
}