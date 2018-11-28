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
    public class ThongbaochuyentiepController : Controller
    {
        // GET: Admin/Thongbaochuyentiep
        public ActionResult Index()
        {
            ThongbaochuyentiepDao dao = new ThongbaochuyentiepDao();
            ThongbaochuyentiepModel model = new ThongbaochuyentiepModel();
            model.listthongbaochuyentiep = dao.listthongbaochuyentiep();
            model.listtaikhoan = dao.listtaikhoan();
            ViewBag.Trangthai = dao.ITrangthai;
            return View(model);
        }
        public JsonResult Themchuyentiep(string chuyentiep, string noidung, string nguoinhan)
        {
            var chuyentiepres = JsonConvert.DeserializeObject<Thongbaochuyentiep>(chuyentiep);
            var session = (Common.TaikhoanLogin)Session[Common.CommonConstants.USER_SESSION];
            chuyentiepres.Noidung = noidung.Replace("&quirk", "<");
            chuyentiepres.Ngaychuyen = DateTime.Now;
            chuyentiepres.Taikhoangui = session.UserName;
            ThongbaochuyentiepDao dao = new ThongbaochuyentiepDao();
            var check = dao.themthongbaochuyentiep(chuyentiepres);
            if (!check)
            {
                return Json(new
                {
                    status = false
                });
            }
            Chitietchuyentiep res = new Chitietchuyentiep();
            res.Machuyentiep = chuyentiepres.Machuyentiep;
            res.Taikhoannhan = nguoinhan;
            res.Ngaynhan = chuyentiepres.Ngaychuyen;
            res.Trangthaixem = "Chưa xem";
            res.Trangthaichuyen = "Đã chuyển";
            res.Flag = true;
            dao.themchitietchuyentiep(res);

            return Json(new
            {
                status = true
            });
            
        }
        public JsonResult Suachuyentiep(string chuyentiep, string noidung, string nguoinhan)
        {
            var chuyentiepres = JsonConvert.DeserializeObject<Thongbaochuyentiep>(chuyentiep);
            chuyentiepres.Noidung = noidung.Replace("&quirk", "<");
            ThongbaochuyentiepDao dao = new ThongbaochuyentiepDao();
            var check = dao.suathongbaochuyentiep(chuyentiepres);
            Chitietchuyentiep res = new Chitietchuyentiep();
            res.Machuyentiep = chuyentiepres.Machuyentiep;
            res.Taikhoannhan = nguoinhan;
            dao.suachitietchuyentiep(res);
            return Json(new
            {
                status = true
            });

        }
        public JsonResult Loadchuyentiep(string id)
        {
            ThongbaochuyentiepDao dao = new ThongbaochuyentiepDao();
            var chuyentiepres = dao.timchuyentiep(id);
            var chitietchuyentiepres = dao.timchitietchuyentiep(id);
            var chuyentiep = new
            {
                machuyentiep = chuyentiepres.Machuyentiep,
                nguoinhan = chitietchuyentiepres.Taikhoannhan,
                tieude = chuyentiepres.Tieude,
                noidung = chuyentiepres.Noidung
            };
            return Json(new
            {
                chuyentiep
            });
        }
        public JsonResult ChangeStatusChuyentiep(string id)
        {
            ThongbaochuyentiepDao dao = new ThongbaochuyentiepDao();
            var res = dao.ChangeStatusChuyentiep(id);
            return Json(new
            {
                status = res
            });
        }
    }
}