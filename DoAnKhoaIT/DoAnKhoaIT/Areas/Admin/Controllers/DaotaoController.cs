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
    public class DaotaoController : BaseAdminController
    {
        // GET: Admin/Daotao
        public ActionResult Index()
        {
            DaotaoDao dao = new DaotaoDao();
            DaotaoModel model = new DaotaoModel();
            model.listloaidaotao = dao.listloaidaotao();
            model.listnoidungdaotao = dao.listnoidungdaotao();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Themloaidaotao(string loaidaotao)
        {
            var loaidaotaores = JsonConvert.DeserializeObject<Loaidaotao>(loaidaotao);
            DaotaoDao dao = new DaotaoDao();
            var check = dao.Themloaidaotao(loaidaotaores);
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
        public JsonResult Sualoaidaotao(string loaidaotao)
        {
            var loaidaotaores = JsonConvert.DeserializeObject<Loaidaotao>(loaidaotao);
            DaotaoDao dao = new DaotaoDao();
            dao.Sualoaidaotao(loaidaotaores);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadloaidaotao(string id)
        {
            var res = new DaotaoDao().timloaidaotao(id);
            var loaidaotao = new
            {
                Maloai = res.MaloaiDT,
                Tenloai = res.Tenloai
            };
            return Json(new
            {
                loaidaotao
,
                status = true
            });
        }
        public JsonResult ChangeStatusLoaidaotao(string id)
        {
            var res = new DaotaoDao().changestatusloaidaotao(id);
            return Json(new
            {
                status = res
            });
        }
        public JsonResult Themnoidungdaotao(string noidungdaotao, string noidung)
        {
            var noidungdaotaores = JsonConvert.DeserializeObject<NoidungDT>(noidungdaotao);
            noidungdaotaores.Ngaydang = DateTime.Now;
            noidungdaotaores.NoidungDT1 = noidung.Replace("&quirk", "<");
            var session = (Common.TaikhoanLogin)Session[Common.CommonConstants.USER_SESSION];
            noidungdaotaores.Tentaikhoan = session.UserName;
            DaotaoDao dao = new DaotaoDao();
            var check = dao.Themnoidungdaotao(noidungdaotaores);
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
        public JsonResult Suanoidungdaotao(string noidungdaotao, string noidung)
        {
            var noidungdaotaores = JsonConvert.DeserializeObject<NoidungDT>(noidungdaotao);
            noidungdaotaores.NoidungDT1 = noidung.Replace("&quirk", "<");
            var res = new DaotaoDao().Suanoidungdaotao(noidungdaotaores);
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Loadnoidungdaotao(string id)
        {
            var res = new DaotaoDao().timnoidungdaotao(id);
            var noidungdaotao = new
            {
                MaNDDT = res.MaNDDT,
                MaLDT = res.MaloaiDT,
                Noidung = res.NoidungDT1,
                Tieude = res.Tieude
            };
            return Json(new
            {
                noidungdaotao,
                status = true
            });
        }
        public JsonResult ChangeStatusNoidungdaotao(string id)
        {
            var res = new DaotaoDao().changestatusnoidungdaotao(id);
            return Json(new
            {
                status = res
            });
        }
    }
}