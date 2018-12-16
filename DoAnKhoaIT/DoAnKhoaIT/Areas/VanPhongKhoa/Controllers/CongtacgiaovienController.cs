using Model.DAO.Admin;
using Model.EF;
using Model.ViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class CongtacgiaovienController : Controller
    {
        // GET: VanPhongKhoa/Congtacgiaovien
        public ActionResult Index()
        {
            CongtacgiaovienDao dao = new CongtacgiaovienDao();
            CongtacgiaovienModel model = new CongtacgiaovienModel();
            model.listcongtacgiaovien = dao.listcongtacgiaovien();
            model.listchitietcongtacgiaovien = dao.listchitietcongtacgiaovien();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Themcongtac(string congtac)
        {
            var congtacres = JsonConvert.DeserializeObject<CongtacGV>(congtac);
            var check = new CongtacgiaovienDao().Themcongtacgiaovien(congtacres);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suacongtac(string congtac)
        {
            var congtacres = JsonConvert.DeserializeObject<CongtacGV>(congtac);
            var res = new CongtacgiaovienDao().Suacongtacgiaovien(congtacres);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Loadcongtac(string id)
        {
            var res = new CongtacgiaovienDao().timcongtacgiaovien(id);
            var congtac = new
            {
                macongtac = res.MaCT,
                tencongtac = res.TenCT
            };
            return Json(new
            {
                congtac
            });
        }
        public JsonResult ChangeStatusCongtac(string id)
        {
            var res = new CongtacgiaovienDao().changestatuscongtacgiaovien(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themchitietcongtac(string chitietcongtac, string noidung, string thanhphan)
        {
            var chitietcongtacres = JsonConvert.DeserializeObject<ChitietCTGV>(chitietcongtac);
            chitietcongtacres.Noidung = noidung.Replace("&quirk", "<");
            chitietcongtacres.Thanhphan = thanhphan.Replace("&quirk", "<");
            var check = new CongtacgiaovienDao().Themchitietcongtacgiaovien(chitietcongtacres);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suachitietcongtac(string chitietcongtac, string noidung, string thanhphan)
        {
            var chitietcongtacres = JsonConvert.DeserializeObject<ChitietCTGV>(chitietcongtac);
            chitietcongtacres.Noidung = noidung.Replace("&quirk", "<");
            chitietcongtacres.Thanhphan = thanhphan.Replace("&quirk", "<");
            var res = new CongtacgiaovienDao().Suachitietcongtacgiaovien(chitietcongtacres);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Loadchitietcongtac(string id)
        {
            var res = new CongtacgiaovienDao().timchitietcongtacgiaovien(id);
            var chitietcongtac = new
            {
                mactct = res.MaCTCTGV,
                mact = res.MaCT,
                ngayct = res.NgayCT.Value.ToShortDateString(),
                noidung = res.Noidung,
                thanhphan = res.Thanhphan,
                diadiem = res.Diadiem,
                chutri = res.Chutri,
                bosung = res.Bosung
            };
            return Json(new
            {
                chitietcongtac
            });
        }
        public JsonResult ChangeStatusChitietcongtac(string id)
        {
            var res = new CongtacgiaovienDao().changestatuschitietcongtacgiaovien(id);
            return Json(new
            {
                status = res
            });
        }
    }
}