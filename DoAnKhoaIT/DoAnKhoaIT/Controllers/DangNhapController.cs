using DoAnKhoaIT.Common;
using DoAnKhoaIT.Models;
using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Controllers
{
    public class DangNhapController : Controller
    {
        // GET: DangNhap
        public ActionResult Index()
        {
            HttpCookie ck_tentaikhoan = Request.Cookies.Get("Tentaikhoan");
            HttpCookie ck_matkhau = Request.Cookies.Get("Matkhau");
            HttpCookie ck_luumatkhau = Request.Cookies.Get("LuuMatkhau");
            if (ck_luumatkhau == null)
            {
                HttpCookie LuuMatkhau = RememberMe.CreateCookie("LuuMatkhau", "false");
                Response.Cookies.Add(LuuMatkhau);
                ck_luumatkhau = Request.Cookies.Get("LuuMatkhau");
            }
            TaikhoanModel target = new TaikhoanModel();

            if (ck_luumatkhau.Value == "false")
            {
                HttpCookie Tentaikhoan = RememberMe.CreateCookie("Tentaikhoan", "");
                Request.Cookies.Add(Tentaikhoan);
                HttpCookie Matkhau = RememberMe.CreateCookie("Matkhau", "");
                Request.Cookies.Add(Matkhau);
                HttpCookie LuuMatkhau = RememberMe.CreateCookie("LuuMatkhau", "");
                Request.Cookies.Add(LuuMatkhau);
                target.UserName = "";
                target.Password = "";
                target.RememberMe = false;
            }
            else
            {

                target.UserName = ck_tentaikhoan.Value;
                target.Password = ck_matkhau.Value;
                target.RememberMe = true;
            }
            return View(target);
        }
        [HttpPost]
        public ActionResult Index(TaikhoanModel collection)
        {
            if (ModelState.IsValid)
            {


                var dao = new DangNhapDao();
                var res = dao.login(collection.UserName, Encryptor.Encrypt(collection.Password, collection.UserName));
                if (res == 1)
                {
                    if (collection.RememberMe)
                    {
                        HttpCookie Tentaikhoan = RememberMe.CreateCookie("Tentaikhoan", collection.UserName);
                        Response.Cookies.Add(Tentaikhoan);
                        HttpCookie Matkhau = RememberMe.CreateCookie("Matkhau", collection.Password);
                        Response.Cookies.Add(Matkhau);
                        HttpCookie LuuMatkhau = RememberMe.CreateCookie("LuuMatkhau", "true");
                        Response.Cookies.Add(LuuMatkhau);
                    }
                    else
                    {
                        HttpCookie LuuMatkhau = RememberMe.CreateCookie("LuuMatkhau", "false");
                        Response.Cookies.Add(LuuMatkhau);
                    }
                    var user = dao.GetById(collection.UserName);
                    var usersession = new TaikhoanLogin();
                    usersession.UserName = user.Tentaikhoan;                   
                    Session.Add(CommonConstants.USER_SESSION, usersession);
                    return RedirectToAction("Index", "Admin/Home");
                }
                else
                    if (res == -1)
                {
                    ModelState.AddModelError("", "Tên đăng nhập không tồn tại");
                }
                else
                        if (res == 0)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else
                    if (res == 2)
                {
                    ModelState.AddModelError("", "Tài khoản đã bị khóa");
                }
            }
            return View(collection);

        }
    }
}