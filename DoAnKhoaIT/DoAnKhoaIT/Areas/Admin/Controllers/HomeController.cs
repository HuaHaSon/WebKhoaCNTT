using DoAnKhoaIT.Controllers;
using Model.DAO.Admin;
using Model.EF;
using Model.ViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class HomeController : BaseAdminController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            HomeModel model = new HomeModel();
            model.listchitietnghiencuukhoahoc = new NghiencuukhoahocDao().listchitietnghiencuukhoahoc();
            ViewBag.giaovien = new BomonDao().listgiaovien().Count();
            ViewBag.monhoc = new BomonDao().listmonhoc().Count();
            return View(model);
        }
        public JsonResult loadlichGV(string status)
        {
            CongtacgiaovienDao dao = new CongtacgiaovienDao();
            var list = dao.listchitietcongtacgiaovien();
            List<ChitietCTGV> res = new List<ChitietCTGV>();
            foreach (var item in list)
            {
                res.Add(new ChitietCTGV
                {
                    MaCTCTGV = item.MaCTCTGV,
                    Diadiem = item.Diadiem,
                    NgayCT = item.NgayCT
                });
            }
            var data = JsonConvert.SerializeObject(res);
            return Json(new
            {
                data
            });
        }
        public JsonResult LoadchitietCongtacgiaovien(string id)
        {
            CongtacgiaovienDao dao = new CongtacgiaovienDao();
            var res = dao.timchitietcongtacgiaovien(id);
            var congtac = new {
                mactct = res.MaCTCTGV,
                ngayct = res.NgayCT.Value.ToShortDateString(),
                noidung = res.Noidung,
                thanhphan = res.Thanhphan,
                chutri = res.Chutri,
                diadiem = res.Diadiem
            };
            return Json(new
            {
                congtac
            });
        }
        public JsonResult loadchitietkhoahoc(string id)
        {
            NghiencuukhoahocDao dao = new NghiencuukhoahocDao();
            var res = dao.timchitietnghiencuukhoahoc(id);
            var khoahoc = new
            {
                tieude = res.Tieude,
                ngaykh = res.NgaySK.Value.ToShortDateString(),
                noidung = res.Noidung
            };
            return Json(new
            {
                khoahoc
            });
        }
    }
}