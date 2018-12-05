using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO.GiaoVien;
using Model.ViewModel;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class HomeController : Controller
    {
        // GET: GiaoVien/Home
        HomeDAO dao = new HomeDAO();
        public ActionResult IndexGV()
        {
            View3baidang model = new View3baidang();
            model.v1 = dao.Load3baidang("TT");
            model.v2 = dao.Load3baidang("SK");
            model.v3 = dao.Load3baidang("TB");
            model.v4 = dao.LoadSKKH();
            model.v5 = dao.LoadDaoTao();
            model.v8 = dao.GetDaoTao();
            model.v9 = dao.GetSKKH();
            return View(model);
        }
    }
}