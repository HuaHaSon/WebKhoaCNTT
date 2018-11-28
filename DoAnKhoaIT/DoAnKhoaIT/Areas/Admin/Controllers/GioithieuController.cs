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
    public class GioithieuController : BaseController
    {
        // GET: Admin/Gioithieu
        public ActionResult Index()
        {
            GioithieuDao dao = new GioithieuDao();
            GioithieuModel model = new GioithieuModel();
            model.listloaigioithieu = dao.listloaigioithieu();
            model.listnoidunggioithieu = dao.listnoidunggioithieu();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Themloaigioithieu(string loaigioithieu)
        {
            var loaigioithieures = JsonConvert.DeserializeObject<LoaiGT>(loaigioithieu);
            GioithieuDao dao = new GioithieuDao();
            var check = dao.themloaigioithieu(loaigioithieures);
            if (check == false)
            {
                return Json(new
                {
                    status = false
                });

            }
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Sualoaigioithieu(string loaigioithieu)
        {
            var loaigioithieures = JsonConvert.DeserializeObject<LoaiGT>(loaigioithieu);
            GioithieuDao dao = new GioithieuDao();
            dao.sualoaigioithieu(loaigioithieures);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadloaigioithieu(string id)
        {
            var res = new GioithieuDao().timloaigioithieu(id);
            var loaigioithieu = new
            {
                Maloai = res.MaGT,
                Tenloai = res.TenGT
            };
            return Json(new
            {
                loaigioithieu
,
                status = true
            });
        }
        public JsonResult ChangeStatusLoaigioithieu(string id)
        {
            var res = new GioithieuDao().ChangeStatusLoaigioithieu(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themnoidunggioithieu(string noidunggioithieu, string noidung)
        {
            var noidunggioithieures = JsonConvert.DeserializeObject<NoidungGT>(noidunggioithieu);
            noidunggioithieures.Ngaydang = DateTime.Now;
            noidunggioithieures.Noidung = noidung.Replace("&quirk", "<");
            var session = (Common.TaikhoanLogin)Session[Common.CommonConstants.USER_SESSION];
            noidunggioithieures.Tentaikhoan = session.UserName;
            GioithieuDao dao = new GioithieuDao();
            var check = dao.themnoidunggioithieu(noidunggioithieures);
            if (!check)
            {
                return Json(new
                {
                    status = false
                });
            }
            return Json(new
            {
                status = true
            });

        }
        public JsonResult Suanoidunggioithieu(string noidunggioithieu, string noidung)
        {
            var noidunggioithieures = JsonConvert.DeserializeObject<NoidungGT>(noidunggioithieu);
            noidunggioithieures.Noidung = noidung.Replace("&quirk", "<");
            var res = new GioithieuDao().suanoidunggioithieu(noidunggioithieures);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadnoidunggioithieu(string id)
        {
            var res = new GioithieuDao().timnoidunggioithieu(id);
            var noidunggioithieu = new
            {
                MaNDGT = res.MaNDGT,
                MaGT = res.MaGT,
                Noidung = res.Noidung,
                Tieude = res.Tieude
            };
            return Json(new
            {
                noidunggioithieu,
                status = true
            });
        }
        public JsonResult ChangeStatusNoidunggioithieu(string id)
        {
            var res = new GioithieuDao().ChangeStatusNoidunggioithieu(id);
            return Json(new
            {
                status = res
            });
        }
    }
}