using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaIT.Controllers;
using Model.DAO.Guest;
using Model.EF;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class GioiThieuController : BaseGiaovienController
    {
        // GET: GiaoVien/GioiThieu
        public ActionResult GioiThieu(string tieude)
        {
            GioiThieuDAO dao = new GioiThieuDAO();
            var res = dao.LoadGTC(tieude);
            if (res == null)
                return View(new NoidungGT());
            return View(res);
        }
        public ActionResult GioiThieu_CCTC(string tieude)
        {
            GioiThieuDAO dao = new GioiThieuDAO();
            var res = dao.LoadCCTC(tieude);
            if (res == null)
                return View(new NoidungGT());
            return View(res);
        }

    }
}