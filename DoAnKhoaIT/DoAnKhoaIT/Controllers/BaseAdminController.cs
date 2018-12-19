﻿using DoAnKhoaIT.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DoAnKhoaIT.Controllers
{
    public class BaseAdminController : BaseController
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (TaikhoanLogin)Session[CommonConstants.USER_SESSION];
            if (session != null && session.chucvu == "CV1")
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                {
                    action = "IndexGV",
                    controller = "Home",
                    area = "GiaoVien"
                }));
            }else{
                if (session != null && session.chucvu == "CV8")
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        action = "Index",
                        controller = "Home",
                        area = "VanPhongKhoa"
                    }));
                }else{
                    if (session != null && session.chucvu != "CV2" && session.chucvu != "CV3")
                    {
                        filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                        {
                            action = "Index",
                            controller = "Home",
                            area = "TroLi"
                        }));
                    }
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}