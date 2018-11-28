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
    public class BieumauthutucController : BaseController
    {
        // GET: Admin/Bieumauthutuc
        public ActionResult Index()
        {
            BieumauthutucDao dao = new BieumauthutucDao();
            BieumauthutucModel model = new BieumauthutucModel();
            model.listbieumauthutuc = dao.listbieumauthutuc();
            model.listnoidungbieumauthutuc = dao.listnoidungbieumauthutuc();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Thembieumau(string bieumau)
        {
            var bieumaures = JsonConvert.DeserializeObject<Bieumauthutuc>(bieumau);
            BieumauthutucDao dao = new BieumauthutucDao();
            var check = dao.Thembieumau(bieumaures);
            if(check == false)
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
        public JsonResult Suabieumau(string bieumau)
        {
            var bieumaures = JsonConvert.DeserializeObject<Bieumauthutuc>(bieumau);
            BieumauthutucDao dao = new BieumauthutucDao();
            dao.Suabieumau(bieumaures);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadbieumau(string id)
        {
            var res = new BieumauthutucDao().timbieumau(id);
            var bieumau = new
            {
                MaBMTT = res.MaBMTT,
                TenBMTT = res.TenBMTT
            };
            return Json(new
            {
                bieumau
,
                status = true
            });
        }
        public JsonResult ChangeStatusBieumau(string id)
        {
            var res = new BieumauthutucDao().changestatusbieumau(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themnoidungbieumau(string noidungbieumau, string noidung)
        {
            var noidungbieumaures = JsonConvert.DeserializeObject<NoidungBMTT>(noidungbieumau);
            noidungbieumaures.Ngaydang = DateTime.Now;
            noidungbieumaures.NoidungBMTT1 = noidung.Replace("&quirk", "<");
            var session = (Common.TaikhoanLogin)Session[Common.CommonConstants.USER_SESSION];
            noidungbieumaures.Tentaikhoan = session.UserName;
            BieumauthutucDao dao = new BieumauthutucDao();
            var check = dao.Themnoidungbieumau(noidungbieumaures);
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
        public JsonResult Suanoidungbieumau(string noidungbieumau, string noidung)
        {
            var noidungbieumaures = JsonConvert.DeserializeObject<NoidungBMTT>(noidungbieumau);
            noidungbieumaures.NoidungBMTT1 = noidung.Replace("&quirk", "<");
            var res = new BieumauthutucDao().Suanoidungbieumau(noidungbieumaures);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadnoidungbieumau(string id)
        {
            var res = new BieumauthutucDao().timnoidungbieumau(id);
            var noidungbieumau = new
            {
                MaND = res.MaNDBMTT,
                MaBM = res.MaBMTT,
                Noidung = res.NoidungBMTT1,
                Tieude = res.Tieude
            };
            return Json(new
            {
                noidungbieumau,
                status = true
            });
        }
        public JsonResult ChangeStatusNoidungbieumau(string id)
        {
            var res = new BieumauthutucDao().changestatusnoidungbieumau(id);
            return Json(new
            {
                status = res
            });
        }
    }
}