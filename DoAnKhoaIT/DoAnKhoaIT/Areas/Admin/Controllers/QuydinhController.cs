using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class QuydinhController : BaseAdminController
    {
        // GET: Admin/Quydinh
        public ActionResult Index()
        {
            return View();
        }
    }
}