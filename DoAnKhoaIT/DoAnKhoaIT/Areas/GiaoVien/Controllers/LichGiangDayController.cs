using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnKhoaIT.Controllers;
using Model.DAO.GiaoVien;
using Model.ViewModel;

namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class LichGiangDayController : BaseGiaovienController
    {
        // GET: GiaoVien/LichGiangDay
        LichGV dao = new LichGV();
        public ActionResult LichHop(string mact,string ngay)
        {            
            DateTime day = DateTime.ParseExact(ngay, "dd/MM/yyyy", null);
            LichGiaoVienModel model = new LichGiaoVienModel();
            model.listchitietcongtac = dao.lich(day, mact);
            model.ngay = day;

            DateTime[] dd = new DateTime[19];
            int[] k = new int[19];
            var val = 1801;
            DateTime ngaybatdau = DateTime.ParseExact("06/08/2018", "dd/MM/yyyy", null);
            for (int i = 0; i < 19; ++i)
            {
                k[i] = val++;
                dd[i] = ngaybatdau;
                ngaybatdau = ngaybatdau.AddDays(7);
            }
            ViewBag.chon = 1801;
            for (int i = 18; i >= 0; i--)
            {
                if (day >= dd[i])
                {
                    ViewBag.chon = k[i];
                    break;
                }
            }

            ViewBag.lich = mact;
            return View(model);
        }
        public ActionResult LichTrucTuan()
        {
            return View();
        }
    }
}