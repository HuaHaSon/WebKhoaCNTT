using DoAnKhoaIT.Controllers;
using Model.DAO.GiaoVien;
using Model.EF;
using System.Web.Mvc;
namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class NghienCuuKHController : BaseGiaovienController
    {
        // GET: GiaoVien/NghienCuuKH
        NghienCuuKH dao = new NghienCuuKH();
        public ActionResult NCKH(int page=1,int pagesize=5)
        {
            var res = dao.ListALL(page, pagesize);
            if (res == null)
                return View(new ChitietNCKH());
            return View(res);
        }
        public ActionResult CT_NCKH(string mannckh,string tenloai)
        {
            ViewBag.TenLoai = tenloai;
            ViewBag.HoTen = dao.GetTenTK(mannckh);
            var res = dao.CTNCKH(mannckh);
            //if (res == null)
            //    return View(new ChitietNCKH());
            return View(res);
        }
        public ActionResult NCKH_BaiBao()
        {
            return View();
        }
    }
}