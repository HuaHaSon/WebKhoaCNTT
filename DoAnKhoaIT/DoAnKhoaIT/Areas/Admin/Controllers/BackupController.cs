using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SqlServer.Management.Smo;
using System.Web.Mvc;
using Model.EF;
using Microsoft.SqlServer.Management.Common;
using DoAnKhoaIT.Controllers;

namespace DoAnKhoaIT.Areas.Admin.Controllers
{
    public class BackupController : BaseAdminController
    {
        // GET: Admin/Backup
        SGU db = new SGU();
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult backup(string mocthoigian)
       {
            mocthoigian = '"' + mocthoigian + '"';
            var time = db.Saoluus.ToList();
            foreach(var item in time)
            {
                if(mocthoigian.Equals(item.Thoigian))
                {
                    var res = db.Details.SingleOrDefault();
                    var sv = res.Tenserver;
                    var username = res.tentk;
                    var pass = res.matkhau;
                    var data = res.data;
                    string ten = "backup_" + DateTime.Now.ToString("dd_MM_yyyy_hh_mm_ss");
                    try
                    {
                        Server sql = new Server(new ServerConnection(sv, username, pass));
                        Backup bk = new Backup()
                        {
                            Action = BackupActionType.Database,
                            Database = data
                        };
                        bk.Devices.AddDevice(@"E:\" + ten + ".bak", DeviceType.File);
                        bk.Initialize = true;
                        bk.SqlBackupAsync(sql);

                        Filebackup f = new Filebackup();
                        f.tenfile = ten + ".bak";
                        f.filepath = @"E:\" + ten + ".bak";
                        db.Filebackups.Add(f);
                        db.SaveChanges();
                    }
                    catch
                    {
                        return Json(new
                        {
                            status = "0"
                        });
                    }
                    return Json(new
                    {
                        status = "1"
                    });
                }
            }
            return Json(new
            {
                status = "-1"
            });           
        }

    }
}