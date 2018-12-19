using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class GooglemapController : BaseAdminController
    {
        // GET: Admin/Googlemap
        public ActionResult Index()
        {
            return View();
        }
    }
}