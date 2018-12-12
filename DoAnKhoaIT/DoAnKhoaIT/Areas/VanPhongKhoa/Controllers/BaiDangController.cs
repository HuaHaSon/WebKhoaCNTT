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
    public class BaiDangController : Controller
    {
        // GET: VanPhongKhoa/BaiDang
        public ActionResult BD()
        {
            BaidangDao dao = new BaidangDao();
            BaidangAdminModel model = new BaidangAdminModel();
            model.listbaidang = dao.listbaidang();
            model.listloaibaidang = dao.listloaibaidang();
            model.listchucvu = dao.listchucvu();
            model.listag = dao.listtag();
            model.listchucvudangbai = dao.listchucvudangbai();
            model.listagdangbai = dao.listtagdangbai(dao.listchucvudangbai().First().Machucvu); // lay ma dau tien
            ViewBag.Trangthai = dao.ITrangthai;
            ViewBag.Hienthi = dao.IHienthi;
            return View(model);
        }
        [HttpPost]
        public JsonResult Thembaidang(string baidang, string noidung, string[] listtag)
        {
            Baidang baidangres = JsonConvert.DeserializeObject<Baidang>(baidang);
            baidangres.Noidung = noidung.Replace("&quirk", "<");
            baidangres.Ngaydang = DateTime.Now;
            if (listtag == null)
            {
                return Json(new
                {
                    status = "1"
                });
            }
            BaidangDao dao = new BaidangDao();

            var check = dao.thembaidang(baidangres);

            if (check == false)
            {
                return Json(new
                {
                    status = "2"
                });
            }

            for (int i = 0; i < listtag.Length; ++i)
            {
                dao.themchitietbaidang(listtag[i], baidangres.Mabaidang);
            }
            return Json(new
            {
                status = "3"
            });
        }
        [HttpPost]
        public JsonResult Suabaidang(string baidang, string noidung, string[] listtag)
        {
            Baidang baidangres = JsonConvert.DeserializeObject<Baidang>(baidang);
            baidangres.Noidung = noidung.Replace("&quirk", "<");

            if (listtag == null)
            {
                return Json(new
                {
                    status = false
                });
            }

            BaidangDao dao = new BaidangDao();

            var check = dao.suabaidang(baidangres);

            dao.xoachitietbaidang(baidangres.Mabaidang);

            for (int i = 0; i < listtag.Length; ++i)
            {
                dao.themchitietbaidang(listtag[i], baidangres.Mabaidang);
            }

            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult Chucvudangbai(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.listtagdangbai(id);
            string[] taglist = new string[res.Count()];
            string[] tagidlist = new string[res.Count()];
            int i = 0;
            foreach (var item in res)
            {
                taglist[i] = item.TenTag;
                tagidlist[i] = item.TagID;
                ++i;
            }
            return Json(new
            {
                list = taglist,
                listid = tagidlist,
                status = true
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusBaidang(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.ChangeStatusbaidang(id);
            return Json(new
            {
                status = res
            });
        }
        [HttpPost]
        public JsonResult LoadBaidang(string id)
        {
            BaidangDao dao = new BaidangDao();
            var listtag = dao.timchitietbaidang(id);
            string[] listtagres = new string[listtag.Count()];
            int i = 0;
            foreach (var item in listtag)
            {
                listtagres[i] = item.TagID;
                ++i;
            }

            var chucvudangbai = dao.timtagbyid(listtag.First().TagID).Machucvu;

            var res = dao.timbaidang(id);
            var baidangres = new
            {
                mabaidang = res.Mabaidang,
                maloai = res.Maloai,
                tieude = res.Tieude,
                noidung = res.Noidung,
                doituonghienthi = res.ĐoituongHT,
                thoigianhieuluc = res.Thoigianhieuluc.Value.ToShortDateString().ToString(),
            };
            return Json(new
            {
                baidang = baidangres,
                taglist = listtagres,
                chucvu = chucvudangbai
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusLoaibaidang(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.ChangeStatusloaibaidang(id);
            return Json(new
            {
                status = res
            });
        }
        [HttpPost]
        public JsonResult Themloaibaidang(string loaibaidang)
        {
            var loaibaidangres = JsonConvert.DeserializeObject<Loaibaidang>(loaibaidang);
            BaidangDao dao = new BaidangDao();
            var check = dao.themloaibaidang(loaibaidangres);
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
        [HttpPost]
        public JsonResult Sualoaibaidang(string loaibaidang)
        {
            var loaibaidangres = JsonConvert.DeserializeObject<Loaibaidang>(loaibaidang);
            BaidangDao dao = new BaidangDao();
            var check = dao.sualoaibaidang(loaibaidangres);
            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult Loadloaibaidang(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.timloaibaidang(id);
            var loaibaidang = new
            {
                maloai = res.Maloai,
                tenloai = res.Tenloai,
            };
            return Json(new
            {
                loaibaidang
            });
        }
        [HttpPost]
        public JsonResult ChangeStatusTagid(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.ChangeStatustagid(id);
            return Json(new
            {

                status = res
            });
        }
        [HttpPost]
        public JsonResult Themtagid(string tagid)
        {
            var tagidres = JsonConvert.DeserializeObject<Tag>(tagid);
            BaidangDao dao = new BaidangDao();
            var check = dao.themtagid(tagidres);
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
        [HttpPost]
        public JsonResult Loadtagid(string id)
        {
            BaidangDao dao = new BaidangDao();
            var res = dao.timtagbyid(id);
            var tagid = new
            {
                tagid = res.TagID,
                tentag = res.TenTag,
                machucvu = res.Machucvu,
            };
            return Json(new
            {
                tagid
            });
        }
        [HttpPost]
        public JsonResult Suatagid(string tagid)
        {
            BaidangDao dao = new BaidangDao();
            var tagidres = JsonConvert.DeserializeObject<Tag>(tagid);
            var check = dao.suatagid(tagidres);
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
    }
}