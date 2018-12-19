using DoAnKhoaIT.Controllers;
using Model.DAO.Admin;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class ThongkebaidangController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Thongkebaidang
        public ActionResult Index()
        {
            return View();
        }
        private class truycap
        {
            public string ngay { get; set; }
            public int soluong { get; set; }
        };
        public JsonResult loadbaidang(string startdate, string enddate)
        {
            BaidangDao dao = new BaidangDao();

            DateTime d1 = Convert.ToDateTime(startdate);
            DateTime d2 = Convert.ToDateTime(enddate);
            var res = dao.thongkebaidangtheongay(d1, d2);
            List<truycap> list = new List<truycap>();
            var t = d1;
            for (int i = 0; i < res.Length; ++i)
            {
                var x = t.Day + "/" + t.Month + "/" + t.Year;
                list.Add(new truycap
                {
                    ngay = x,
                    soluong = res[i]
                });
                t = t.AddDays(1);
            }
            var baidang = JsonConvert.SerializeObject(list);
            return Json(new
            {
                baidang
            });
        }
    }
}