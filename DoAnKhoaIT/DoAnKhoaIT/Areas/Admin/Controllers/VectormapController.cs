using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class VectormapController : BaseAdminController
    {
        // GET: Admin/Vectormap
        public ActionResult Index()
        {
            return View();
        }
    }
}