using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SqlServer.Management.Smo;
using System.Web.Mvc;
using Microsoft.SqlServer.Management.Common;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class BackupController : Controller
    {
        // GET: Admin/Backup
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult backup(string sv, string username, string pass, string db)
        {
            sv = @"DESKTOP-MEMEU1K\THANHETN";
            username = "sa";
            pass = "1";
            db = "DbKhoaCNTT";
            string ten = "backup" + DateTime.Now.ToShortDateString();
            try
            {
                Server sql = new Server(new ServerConnection(sv,username,pass));
                Backup bk = new Backup()
                {
                    Action = BackupActionType.Database,
                    Database = db
                };
                bk.Devices.AddDevice(@"D:\" + ten + ".bak", DeviceType.File);
                bk.Initialize = true;
                bk.SqlBackupAsync(sql);
            }
            catch
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