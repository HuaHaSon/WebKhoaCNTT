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
    public class BomonController : BaseAdminController
    {
        // GET: Admin/Bomon
        public ActionResult Index()
        {
            BomonDao dao = new BomonDao();
            BomonModel model = new BomonModel();
            model.listbomon = dao.listbomon();
            model.listmonhoc = dao.listmonhoc();
            model.listgiaovien = dao.listgiaovien();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Thembomon(string bomon,string noidung)
        {
            var bomonres = JsonConvert.DeserializeObject<Bomon>(bomon);
            bomonres.Noidung = noidung.Replace("&quirk", "<");
            BomonDao dao = new BomonDao();
            var check = dao.thembomon(bomonres);
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
        public JsonResult Suabomon(string bomon, string noidung)
        {
            var bomonres = JsonConvert.DeserializeObject<Bomon>(bomon);
            bomonres.Noidung = noidung.Replace("&quirk", "<");
            BomonDao dao = new BomonDao();
            var res = dao.suabomon(bomonres);
            return Json(new
            {
                status = res
            });

        }
        public JsonResult Loadbomon(string id)
        {
            var res = new BomonDao().timbomon(id);
            var bomon = new
            {
                mabomon = res.MaBM,
                tenbomon = res.TenBM,
                noidung = res.Noidung
            };
            return Json(new
            {
                bomon,
                status = true
            });

        }
        public JsonResult ChangeStatusbomon(string id)
        {
            var res = new BomonDao().changestatusbomon(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themmonhoc(string monhoc)
        {
            var monhocres = JsonConvert.DeserializeObject<Monhoc>(monhoc);
            BomonDao dao = new BomonDao();
            var check = dao.themmonhoc(monhocres);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suamonhoc(string monhoc)
        {
            var monhocres = JsonConvert.DeserializeObject<Monhoc>(monhoc);
            BomonDao dao = new BomonDao();
            var res = dao.suamonhoc(monhocres);
            return Json(new
            {
                res
            });
        }
        public JsonResult Loadmonhoc(string id)
        {
            var res = new BomonDao().timmonhoc(id);
            var monhoc = new
            {
                mamonhoc = res.MaMH,
                mabomon = res.MaBM,
                tenmonhoc = res.TenMH
            };
            return Json(new
            {
                monhoc
            });
        }
        public JsonResult ChangeStatusMonhoc(string id)
        {
            var res = new BomonDao().changestatusmonhoc(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themgiaovien(string giaovien,string thongtin)
        {
            var giaovienres = JsonConvert.DeserializeObject<ThongtinGV>(giaovien);
            BomonDao dao = new BomonDao();
            giaovienres.ThongtinGV1 = thongtin.Replace("&quirk", "<");
            var check = dao.themgiaovien(giaovienres);
            return Json(new
            {
                status = check
            });
        }
        public JsonResult Suagiaovien(string giaovien, string thongtin)
        {
            var giaovienres = JsonConvert.DeserializeObject<ThongtinGV>(giaovien);
            giaovienres.ThongtinGV1 = thongtin.Replace("&quirk", "<");
            BomonDao dao = new BomonDao();
            var res = dao.suagiaovien(giaovienres);
            return Json(new
            {
                res
            });
        }
        public JsonResult Loadgiaovien(string id)
        {
            var res = new BomonDao().timgiaovien(id);
            var giaovien = new
            {
                magiaovien = res.MaGV,
                mabomon = res.MaBM,
                tengiaovien = res.TenGV,
                chucvu = res.Chucvu,
                chucdanh = res.Chucdanh,
                thongtin = res.ThongtinGV1,
                mail = res.Diachimail
            };
            return Json(new
            {
                giaovien
            });
        }
        public JsonResult ChangeStatusGiaovien(string id)
        {
            var res = new BomonDao().changestatusgiaovien(id);
            return Json(new
            {
                status = res
            });
        }
    }
}