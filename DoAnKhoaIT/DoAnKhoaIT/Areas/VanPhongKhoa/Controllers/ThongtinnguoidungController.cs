using DoAnKhoaIT.Common;
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

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class ThongtinnguoidungController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Thongtinnguoidung
        public ActionResult Index()
        {
            var dao = new ThongtinnguoidungDao();
            ThongtinnguoidungModel res = new ThongtinnguoidungModel();
            res.listtaikhoan = dao.Listtaikhoan();
            res.listchucvu = dao.Listchucvu();
            res.listquyen = dao.Listquyen();
            ViewBag.Ichucvu = dao.Ichucvu();
            ViewBag.Itrangthai = dao.ITrangthai;
            ViewBag.bang = "bang";
            ViewBag.show = "false";
            ViewBag.check = "false";
            return View(res);
        }
        [HttpPost]
        public JsonResult Themtaikhoan(string taikhoan, string thongtinnguoidung)
        {
            // convert
            Taikhoan taikhoanres = JsonConvert.DeserializeObject<Taikhoan>(taikhoan);
            Thongtinnguoidung thongtinnguoidungres = JsonConvert.DeserializeObject<Thongtinnguoidung>(thongtinnguoidung);

            var dao = new ThongtinnguoidungDao();

            taikhoanres.Matkhau = Encryptor.Encrypt(taikhoanres.Matkhau, taikhoanres.Tentaikhoan);

            var check = dao.Themtaikhoan(taikhoanres);

            if (!check)
            {
                return Json(new
                {
                    status = false
                });
            }

            dao.Themthongtin(thongtinnguoidungres);

            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult LoadSuataikhoan(string id)
        {
            var res = new ThongtinnguoidungDao().timtaikhoan(id);
            var res2 = new ThongtinnguoidungDao().timthongtin(id);
            string tt = res2.Namsinh.Value.ToShortDateString().ToString();
            var mk = Decryptor.Decrypt(res.Matkhau, res.Tentaikhoan);
            var result = new
            {
                tentaikhoan = res.Tentaikhoan,
                matkhau = mk,
                hoten = res2.Hoten,
                mail = res2.Gmail,
                machucvu = res2.Machucvu,
                ngaysinh = tt,
                sdt = res2.Sodienthoai,
                quequan = res2.Quequan
            };
            return Json(new
            {
                Jtaikhoan = result
            });
        }
        [HttpPost]
        public JsonResult Suataikhoan(string taikhoan, string thongtinnguoidung)
        {
            Taikhoan taikhoanres = JsonConvert.DeserializeObject<Taikhoan>(taikhoan);
            Thongtinnguoidung thongtinnguoidungres = JsonConvert.DeserializeObject<Thongtinnguoidung>(thongtinnguoidung);
            ThongtinnguoidungDao dao = new ThongtinnguoidungDao();
            taikhoanres.Matkhau = Encryptor.Encrypt(taikhoanres.Matkhau, taikhoanres.Tentaikhoan);
            dao.Suataikhoan(taikhoanres);
            dao.suathongtin(taikhoanres.Tentaikhoan, thongtinnguoidungres);
            var tk = dao.timtaikhoan(taikhoanres.Tentaikhoan);
            var result = new
            {
                tentaikhoan = tk.Tentaikhoan,
                matkhau = tk.Matkhau
            };
            return Json(new
            {
                status = true,
                res = result
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusTaikhoan(string id)
        {
            var res = new ThongtinnguoidungDao().changeStatusTaikhoan(id);
            return Json(new
            {
                status = res
            });
        }
        [HttpPost]
        public JsonResult Themchucvu(string[] list, string chucvu)
        {
            Chucvu chucvures = JsonConvert.DeserializeObject<Chucvu>(chucvu);

            ThongtinnguoidungDao dao = new ThongtinnguoidungDao();
            //kiem tra phan quyen
            if (list == null)
            {
                return Json(new
                {
                    status = 1
                });
            }
            // kiem tra chuc vu
            var check = dao.themchucvu(chucvures);
            if (!check)
            {
                return Json(new
                {
                    status = 2
                });
            }
            //them chi tiet quyen
            for (int i = 0; i < list.Count(); ++i)
            {
                dao.themchitietquyen(chucvures.Machucvu, list[i]);
            }
            return Json(new
            {
                status = 3
            });
        }
        [HttpPost]
        public JsonResult LoadSuachucvu(string id)
        {
            ThongtinnguoidungDao dao = new ThongtinnguoidungDao();
            var chucvu = dao.timchucvu(id);
            var list = dao.timlistquyen(id);
            var dem = dao.Listquyen();
            string[] listdem = new string[dem.Count()];
            string[] listres = new string[list.Count()];

            int i = 0;
            foreach (var item in list)
            {
                listres[i] = item.Maquyen.ToString();
                ++i;
            }

            int j = 0;
            foreach (var item in dem)
            {
                listdem[j] = item.Maquyen;
                ++j;
            }

            var chucvulist = new
            {
                machucvu = chucvu.Machucvu,
                tenchucvu = chucvu.Tenchucvu
            };

            return Json(new
            {
                slquyen = listdem,
                chucvures = chucvulist,
                listquyen = listres,
                status = true
            });

        }
        [HttpPost]
        public JsonResult Suachucvu(string[] list, string chucvu)
        {
            Chucvu chucvures = JsonConvert.DeserializeObject<Chucvu>(chucvu);

            ThongtinnguoidungDao dao = new ThongtinnguoidungDao();
            if (list == null)
            {
                return Json(new
                {
                    status = false
                });
            }
            dao.xoachitietquyen(chucvures.Machucvu);
            for (int i = 0; i < list.Count(); ++i)
            {
                dao.themchitietquyen(chucvures.Machucvu, list[i]);
            }
            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusChucvu(string id)
        {
            var res = new ThongtinnguoidungDao().changeStatusChucvu(id);
            return Json(new
            {
                status = res
            });
        }
        [HttpPost]
        public JsonResult Themquyen(string quyen)
        {
            var quyenres = JsonConvert.DeserializeObject<Quyennguoidung>(quyen);
            var check = new ThongtinnguoidungDao().themquyen(quyenres);
            return Json(new
            {
                status = quyenres
            });
        }
        [HttpPost]
        public JsonResult Suquyen(string quyen)
        {
            var quyenres = JsonConvert.DeserializeObject<Quyennguoidung>(quyen);
            var res = new ThongtinnguoidungDao().suaquyen(quyenres);
            return Json(new
            {
                status = res
            });
        }
        [HttpPost]
        public JsonResult LoadSuaquyen(string id)
        {
            var res = new ThongtinnguoidungDao().timquyen(id);
            var quyen = new
            {
                maquyen = res.Maquyen,
                tenquyen = res.Tenquyen
            };
            return Json(new
            {
                quyen,
                status = true
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusQuyen(string id)
        {
            var res = new ThongtinnguoidungDao().changeStatusQuyen(id);
            return Json(new
            {
                status = res
            });
        }
    }
}