using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Model.DAO.GiaoVien;
using Model.ViewModel;
using Model.EF;
using PagedList;
using System.Text;
using System.IO;
using System.Net.Mime;

namespace DoAnKhoaIT.Areas.GiaoVien.Controllers
{
    public class GuiMailController : Controller
    {
        // GET: GiaoVien/GuiMail
        SGU db = new SGU();
        public ActionResult GuiMail(string txtsearch,int page=1,int pagesize=2)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v1 = dao.LoadThuDen(ten, txtsearch).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);           
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        [HttpPost]
        public JsonResult loadmail(string matkhau, string nguoinhan, string tieude, string mucdo, string noidung)
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
                Attachment data = new Attachment(
                         Server.MapPath(@"~/Files/01.pdf"),
                         MediaTypeNames.Application.Octet);
                mm.Attachments.Add(data);
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                string mk = matkhau;
                NetworkCredential nc = new NetworkCredential(gmail, mk);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Send(mm);
                ViewBag.message = "Đã gửi Email thành công!";
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
        public ActionResult LoadThuGui(string txtsearch,int page = 1, int pagesize = 2)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v2 = dao.LoadThuGui(ten, txtsearch).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);           
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        //[HttpPost]
        //public ActionResult LoadThuGui(FormMail model , string txtsearch,int page = 1, int pagesize = 2)
        //{          
        //    GuiMail dao = new GuiMail();
        //    string ten = HomeController.tentk;
        //    string gmail = dao.GetMail(ten);
            
        //    ViewBag.HoTen = dao.GetTen(ten);
        //    MailMessage mm = new MailMessage();
        //    mm.From = new MailAddress(gmail);

        //    string ToEmail = model.taikhoannhan;
        //    string[] Multi = ToEmail.Split(',');
        //    foreach (string emailid in Multi)
        //    {
        //        mm.To.Add(new MailAddress(emailid));
        //    }

        //    mm.Subject = model.tieude;
        //    mm.Body = model.noidung;
        //    mm.IsBodyHtml = false;

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;

        //    NetworkCredential nc = new NetworkCredential(gmail, model.password);
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = nc;
        //    smtp.Send(mm);
        //    ViewBag.message = "Đã gửi Email thành công!";
        //    dao.ThemTBCT(ten, model);
        //    var res = db.Thongbaochuyentieps.ToList().LastOrDefault();
        //    foreach (string emailid in Multi)
        //    {
        //        dao.ThemCTCT(emailid, res.Machuyentiep.ToString(), res.Flag.ToString());
        //    }
        //    model.v2 = dao.LoadThuGui(ten,txtsearch).ToPagedList(page, pagesize);
        //    ViewBag.SLHTD = dao.CountHTD(ten);
        //    ViewBag.SLHTG = dao.CountTDG(ten);
        //    if (model == null)
        //        return View(new ModelMail());
        //    return View(model);
        //}

        public ActionResult LoadThuXoa(string txtsearch,int page = 1, int pagesize = 2)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v3 = dao.LoadThuXoa(ten, txtsearch).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);                      
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        //[HttpPost]
        //public ActionResult LoadThuXoa(FormMail model, string txtsearch,int page = 1, int pagesize = 2)
        //{
         
        //    GuiMail dao = new GuiMail();
        //    string ten = HomeController.tentk;
        //    string gmail = dao.GetMail(ten);
            
        //    ViewBag.HoTen = dao.GetTen(ten);
        //    MailMessage mm = new MailMessage();
        //    mm.From = new MailAddress(gmail);

        //    string ToEmail = model.taikhoannhan;
        //    string[] Multi = ToEmail.Split(',');
        //    foreach (string emailid in Multi)
        //    {
        //        mm.To.Add(new MailAddress(emailid));
        //    }

        //    mm.Subject = model.tieude;
        //    mm.Body = model.noidung;
        //    mm.IsBodyHtml = false;

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;

        //    NetworkCredential nc = new NetworkCredential(gmail, model.password);
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = nc;
        //    smtp.Send(mm);
        //    ViewBag.message = "Đã gửi Email thành công!";
        //    dao.ThemTBCT(ten, model);
        //    var res = db.Thongbaochuyentieps.ToList().LastOrDefault();
        //    foreach (string emailid in Multi)
        //    {
        //        dao.ThemCTCT(emailid, res.Machuyentiep.ToString(), res.Flag.ToString());
        //    }
        //    model.v3 = dao.LoadThuXoa(ten,txtsearch).ToPagedList(page, pagesize);
        //    ViewBag.SLHTD = dao.CountHTD(ten);
        //    ViewBag.SLHTG = dao.CountTDG(ten);
        //    if (model == null)
        //        return View(new ModelMail());
        //    return View(model);
        //}
        public ActionResult LoadThuNhap(string txtsearch,int page = 1, int pagesize = 2)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v4 = dao.LoadThuNhap(ten, txtsearch).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);          
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        //[HttpPost]
        //public ActionResult LoadThuNhap(FormMail model, string txtsearch,int page = 1, int pagesize = 2)
        //{
         
        //    GuiMail dao = new GuiMail();
        //    string ten = HomeController.tentk;
        //    string gmail = dao.GetMail(ten);
            
        //    ViewBag.HoTen = dao.GetTen(ten);
        //    MailMessage mm = new MailMessage();
        //    mm.From = new MailAddress(gmail);

        //    string ToEmail = model.taikhoannhan;
        //    string[] Multi = ToEmail.Split(',');
        //    foreach (string emailid in Multi)
        //    {
        //        mm.To.Add(new MailAddress(emailid));
        //    }

        //    mm.Subject = model.tieude;
        //    mm.Body = model.noidung;
        //    mm.IsBodyHtml = false;

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;

        //    NetworkCredential nc = new NetworkCredential(gmail, model.password);
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = nc;
        //    smtp.Send(mm);
        //    ViewBag.message = "Đã gửi Email thành công!";
        //    dao.ThemTBCT(ten, model);
        //    var res = db.Thongbaochuyentieps.ToList().LastOrDefault();
        //    foreach (string emailid in Multi)
        //    {
        //        dao.ThemCTCT(emailid, res.Machuyentiep.ToString(), res.Flag.ToString());
        //    }
        //    model.v4 = dao.LoadThuNhap(ten,txtsearch).ToPagedList(page, pagesize);
        //    ViewBag.SLHTD = dao.CountHTD(ten);
        //    ViewBag.SLHTG = dao.CountTDG(ten);
        //    if (model == null)
        //        return View(new ModelMail());
        //    return View(model);
        //}
        public ActionResult LoadThuQT(string txtsearch,int page = 1, int pagesize = 2)
        {
            FormMail model = new FormMail();
            GuiMail dao = new GuiMail();
            string ten = HomeController.tentk;
            model.v5 = dao.LoadThuQuanTrong(ten, txtsearch).ToPagedList(page, pagesize);
            ViewBag.SLHTD = dao.CountHTD(ten);
            ViewBag.SLHTG = dao.CountTDG(ten);
            ViewBag.HoTen = dao.GetTen(ten);         
            if (model == null)
                return View(new ModelMail());
            return View(model);
        }
        //[HttpPost]
        //public ActionResult LoadThuQT(FormMail model, string txtsearch,int page = 1, int pagesize = 2)
        //{           
        //    GuiMail dao = new GuiMail();
        //    string ten = HomeController.tentk;
        //    string gmail = dao.GetMail(ten);
            
        //    ViewBag.HoTen = dao.GetTen(ten);
        //    MailMessage mm = new MailMessage();
        //    mm.From = new MailAddress(gmail);

        //    string ToEmail = model.taikhoannhan;
        //    string[] Multi = ToEmail.Split(',');
        //    foreach (string emailid in Multi)
        //    {
        //        mm.To.Add(new MailAddress(emailid));
        //    }
        //    IHtmlString nd = new HtmlString(model.noidung);
        //    mm.Subject = model.tieude;
        //    mm.Body = nd.ToHtmlString();
        //    mm.IsBodyHtml = false;

        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;

        //    NetworkCredential nc = new NetworkCredential(gmail, model.password);
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = nc;
        //    smtp.Send(mm);
        //    ViewBag.message = "Đã gửi Email thành công!";
        //    dao.ThemTBCT(ten, model);
        //    var res = db.Thongbaochuyentieps.ToList().LastOrDefault();
        //    foreach (string emailid in Multi)
        //    {
        //        dao.ThemCTCT(emailid, res.Machuyentiep.ToString(), res.Flag.ToString());
        //    }
        //    model.v5 = dao.LoadThuQuanTrong(ten,txtsearch).ToPagedList(page, pagesize);
        //    ViewBag.SLHTD = dao.CountHTD(ten);
        //    ViewBag.SLHTG = dao.CountTDG(ten);
        //    ViewBag.HoTen = dao.GetTen(ten);
        //    if (model == null)
        //        return View(new ModelMail());
        //    return View(model);
        //}
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

    }
}