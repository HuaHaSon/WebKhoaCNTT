using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.TroLi
{
    public class TroLiAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "TroLi";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "TroLi_default",
                "TroLi/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}