using Model.DAO.GiaoVien;
using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class MailController : Controller
    {
        // GET: VanPhongKhoa/Mail
        SGU db = new SGU();
        // GET: Admin/Mail
        public ActionResult Index(int page = 1, int pagesize = 4)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v1 = dao.LoadThuDen(ten, null).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        public ActionResult ThuGui(int page = 1, int pagesize = 4)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v2 = dao.LoadThuGui(ten, null).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        public ActionResult ThuQT(int page = 1, int pagesize = 4)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v5 = dao.LoadThuQuanTrong(ten, null).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        public ActionResult ThuNhap(int page = 1, int pagesize = 4)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v4 = dao.LoadThuNhap(ten, null).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        public ActionResult ThuRac(int page = 1, int pagesize = 4)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v3 = dao.LoadThuXoa(ten, null).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        public ActionResult SoanThu(string nguoinhan)
        {
            if (nguoinhan == null)
                return View();
            else
            {
                ViewBag.nguoinhan = nguoinhan;
                return View();
            }


        }
        [HttpPost]
        public JsonResult SoanThu(string matkhau, string nguoinhan, string tieude, string mucdo, string noidung)
        {
            var status = false;
            //try
            //{
            string ten = HomeController.tentk;
            GuiMail dao = new GuiMail();
            string gmail = dao.GetMail(ten);

            ViewBag.HoTen = dao.GetTen(ten);
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(gmail);
            string ToEmail = nguoinhan;
            string[] Multi = ToEmail.Split(',');
            foreach (string emailid in Multi)
            {
                mm.To.Add(new MailAddress(emailid));
            }

            mm.Subject = tieude;
            noidung = noidung.Replace("&quirk", "<");
            mm.Body = noidung;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            string mk = matkhau;
            NetworkCredential nc = new NetworkCredential(gmail, mk);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            smtp.Send(mm);
            FormMail model = new FormMail();
            model.password = matkhau;
            model.tieude = tieude;
            model.noidung = noidung;
            model.flag = mucdo;
            model.taikhoannhan = nguoinhan;
            dao.ThemTBCT(ten, model);
            var res = db.Thongbaochuyentieps.ToList().LastOrDefault();
            foreach (string emailid in Multi)
            {
                dao.ThemCTCT(emailid, res.Machuyentiep.ToString(), res.Flag.ToString());
            }
            status = true;

            //catch (Exception ex)
            //{
            //    status = false;
            //}
            return Json(new
            {
                status
            });
        }
        public ActionResult DocMail(int mact)
        {
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            dao.GetTT(ten, mact);
            string gmail = dao.GetMail(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);

            var res = dao.CTMail(ten, mact);
            if (res == null)
                return View(new ModelMail());
            return View(res);
        }
        public ActionResult DocMailGui(int mact)
        {
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            string gmail = dao.GetMail(ten);
            ViewBag.HoTen = dao.GetTen(ten);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);

            var res = dao.CTMailGui(ten, mact);
            if (res == null)
                return View(new ModelMail());
            return View(res);
        }
        [HttpPost]
        public JsonResult hopthuden()
        {
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            var res = dao.CountHTD(ten);
            return Json(new
            {
                res
            });
        }
        [HttpPost]
        public JsonResult chuyenmail(string list)
        {
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            string[] Multi = list.Split(',');
            foreach (var item in Multi)
            {
                dao.SetThuXoa(item, ten);
            }
            return Json(new
            {

            });
        }
        [HttpPost]
        public JsonResult chuyenmail1(string list)
        {
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            string[] Multi = list.Split(',');
            foreach (var item in Multi)
            {
                dao.SetThuXoaGui(item, ten);
            }
            return Json(new
            {

            });
        }
    }
}