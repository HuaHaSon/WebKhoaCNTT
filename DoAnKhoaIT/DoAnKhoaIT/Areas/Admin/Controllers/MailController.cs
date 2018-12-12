using DoAnKhoaIT.Controllers;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class MailController : BaseAdminController
    {
        // GET: Admin/Mail
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Soanthu()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Soanthu(string nguoinhan, string chude, string noidung)
        {

            return Json(new
            {

            });
        }
    }
}