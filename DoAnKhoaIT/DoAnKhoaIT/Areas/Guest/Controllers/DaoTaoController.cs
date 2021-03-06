﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO.Guest;
namespace DoAnKhoaIT.Areas.Guest.Controllers
{
    public class DaoTaoController : Controller
    {
        // GET: Guest/DaoTao
        DaoTaoDAO dao = new DaoTaoDAO();
        public ActionResult TDDH(string maloaidt,string tenloai,int page=1,int pagesize=5)
        {
            ViewBag.TenLoai = tenloai;
            ViewBag.MaDT = maloaidt;
            var res = dao.LoadList(maloaidt, page, pagesize);
            if (res == null)
                return View(new NoidungDT());
            return View(res);
        }
        public ActionResult CTDT(string manddt,string tenloai,string madt)
        {
            ViewBag.MaDT = madt;
            ViewBag.TenLoai = tenloai;
            var res = dao.CTDT(manddt);
            return View(res);
        }
        //public ActionResult TDTS()
        //{
        //    return View();
        //}
    }
}