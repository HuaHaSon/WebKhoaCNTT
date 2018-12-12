using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa
{
    public class VanPhongKhoaAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "VanPhongKhoa";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "VanPhongKhoa_default",
                "VanPhongKhoa/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}