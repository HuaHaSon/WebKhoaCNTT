using DoAnKhoaIT.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class ThuvienController : BaseAdminController
    {
        // GET: Admin/Thuvien
        public ActionResult Index()
        {
            return View();
        }
    }
}