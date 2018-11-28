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
    public class NghiencuukhoahocController : BaseController
    {
        // GET: Admin/Nghiencuukhoahoc
        public ActionResult Index()
        {
            NghiencuukhoahocDao dao = new NghiencuukhoahocDao();
            NghiencuukhoahocModel model = new NghiencuukhoahocModel();
            model.listnghiencuukhoahoc = dao.listnghiencuukhoahoc();
            model.listchitietnghiencuukhoahoc = dao.listchitietnghiencuukhoahoc();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Themnghiencuu(string nghiencuu)
        {
            var nghiencuures = JsonConvert.DeserializeObject<NghiencuuKH>(nghiencuu);
            var check = new NghiencuukhoahocDao().themnghiencuukhoahoc(nghiencuures);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suanghiencuu(string nghiencuu)
        {
            var nghiencuures = JsonConvert.DeserializeObject<NghiencuuKH>(nghiencuu);
            var res = new NghiencuukhoahocDao().suanghiencuukhoahoc(nghiencuures);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Loadnghiencuu(string id)
        {
            var res = new NghiencuukhoahocDao().timnghiencuukhoahoc(id);
            var nghiencuu = new
            {
                manghiencuu = res.MaNCKH,
                tennghiencuu = res.TenNCKH
            };
            return Json(new
            {
                nghiencuu,
                status = true
            });
        }
        public JsonResult ChangeStatusNghiencuu(string id)
        {
            var res = new NghiencuukhoahocDao().changestatusnghiencuukhoahoc(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themchitietnghiencuu(string chitietnghiencuu, string noidung)
        {
            var chitietnghiencuures = JsonConvert.DeserializeObject<ChitietNCKH>(chitietnghiencuu);
            chitietnghiencuures.Noidung = noidung.Replace("&quirk", "<");
            chitietnghiencuures.Ngaydang = DateTime.Now;
            var session = (Common.TaikhoanLogin)Session[Common.CommonConstants.USER_SESSION];
            chitietnghiencuures.Tentaikhoan = session.UserName;
            var check = new NghiencuukhoahocDao().themchitietnghiencuukhoahoc(chitietnghiencuures);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suachitietnghiencuu(string chitietnghiencuu, string noidung)
        {
            var chitietnghiencuures = JsonConvert.DeserializeObject<ChitietNCKH>(chitietnghiencuu);
            chitietnghiencuures.Noidung = noidung.Replace("&quirk", "<");
            var res = new NghiencuukhoahocDao().suachitietnghiencuukhoahoc(chitietnghiencuures);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Loadchitietnghiencuu(string id)
        {
            var res = new NghiencuukhoahocDao().timchitietnghiencuukhoahoc(id);
            var chitietnghiencuu = new
            {
                mactnc = res.MaCTNCKH,
                manc = res.MaNCKH,
                tieude = res.Tieude,
                noidung = res.Noidung,
                ngaysk = res.NgaySK.Value.ToShortDateString(),
            };
            return Json(new
            {
                chitietnghiencuu
            });
        }
        public JsonResult ChangeStatusChitietnghiencuu(string id)
        {
            var res = new NghiencuukhoahocDao().changestatuschitietnghiencuukhoahoc(id);
            return Json(new
            {
                status = res
            });
        }
    }
}