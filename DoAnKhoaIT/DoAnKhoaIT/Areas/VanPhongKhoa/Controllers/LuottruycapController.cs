using DoAnKhoaIT.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class LuottruycapController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Luottruycap
        public ActionResult Index()
        {
            return View();
        }
        private class truycap
        {
            public string ngay { get; set; }
            public int soluong { get; set; }
        };
        public JsonResult Luottruycap()
        {

            List<truycap> list = new List<truycap>();
            for (int i = 1; i <= 9; ++i)
            {
                var x = "01/" + "0" + i + "/2018";
                list.Add(new truycap
                {
                    soluong = i,
                    ngay = x
                });
            }
            var data = JsonConvert.SerializeObject(list);
            return Json(new
            {
                data
            });
        }
    }
}