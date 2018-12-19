using DoAnKhoaIT.Controllers;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using Model.EF;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;

using System.Web;
using System.Web.Mvc;

namespace DoAnKhoaIT.Areas.VanPhongKhoa.Controllers
{
    public class SaoluuController : BaseVanPhongKhoaController
    {
        // GET: VanPhongKhoa/Saoluu
        SGU db = new SGU();
      
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult savebackup(string saoluu, string mocthoigian)
        {
            var saoluures = JsonConvert.DeserializeObject<Detail>(saoluu);
            var moctime = mocthoigian.Split(',');
            var connectionString = "Server="+saoluures.Tenserver+";Database="+saoluures.data+";User Id = "+saoluures.tentk+";Password = "+saoluures.matkhau+"; ";
            SqlConnection connection = new SqlConnection(connectionString);
            
            try
            {
                connection.Open();

                //Server sql = new Server(new ServerConnection(@""+saoluures.Tenserver, saoluures.tentk, saoluures.matkhau));
                object[] sqlParams =
                {

                };
                db.Database.ExecuteSqlCommand("delete from Saoluu", sqlParams);
                db.Database.ExecuteSqlCommand("delete from Detail", sqlParams);
                db.SaveChanges();

                
                foreach(var item in moctime)
                {
                    Saoluu sl = new Saoluu();
                    sl.Thoigian = item;                    
                    var res = db.Saoluus.Find(sl.Thoigian);
                    if (res == null)
                    {
                        db.Saoluus.Add(sl);
                    }
                    res = null;
                }                                            
                db.Details.Add(saoluures);
                db.SaveChanges();              
                return Json(new
                {
                    status = true
                });
            }
            catch
            {
                return Json(new
                {
                    status = false
                });
            }
      
        }
        [HttpPost]
        public JsonResult loaddulieu()
        {
            var res = db.Details.FirstOrDefault();
            var res2 = db.Filebackups.ToList();
            var saoluu = db.Saoluus.ToList();
            string[] list = new string[saoluu.Count()];
            int i = 0;
            foreach (var item in saoluu)
            {
                list[i] = item.Thoigian;
                ++i;
            };
            var file = JsonConvert.SerializeObject(res2);
            return Json(new
            {
                sv = res.Tenserver,
                username = res.tentk,
                mk = res.matkhau,
                db = res.data,
                list,
                file
            });
                

            
        }
        [HttpPost]
        public JsonResult restore( string backUpFile)
        {
            var res = db.Details.FirstOrDefault();
            string serverName = res.Tenserver;
            string userName = res.tentk;
            string password = res.matkhau;
            string databaseName = res.data;


            Server dbServer = new Server(new ServerConnection(serverName, userName, password));
            Restore dbRestore = new Restore() { Database = databaseName, Action = RestoreActionType.Database, ReplaceDatabase = true, NoRecovery = false };
            dbServer.KillAllProcesses(dbRestore.Database);
            dbRestore.Devices.AddDevice(backUpFile, DeviceType.File);
            dbRestore.SqlRestoreAsync(dbServer);

            //var res = db.Details.FirstOrDefault();
            //string serverName = res.Tenserver;
            //string userName = res.tentk;
            //string password = res.matkhau;
            //string databaseName = res.data;                     

            //SqlConnection cn = new SqlConnection(@"data source = " + serverName + "; initial catalog = " + databaseName + ";integrated security = True; MultipleActiveResultSets = True; App = EntityFramework");
            //cn.Open();
            //string UseMaster = "USE master";
            //SqlCommand UseMasterCommand = new SqlCommand(UseMaster, cn);
            //UseMasterCommand.ExecuteNonQuery();
            //// The below query will rollback any transaction which is
            ////running on that database and brings SQL Server database in a single user mode.
            //       string Alter1 = @"ALTER DATABASE
            //       [" + databaseName + "] SET Single_User WITH Rollback Immediate";
            //SqlCommand Alter1Cmd = new SqlCommand(Alter1, cn);
            //Alter1Cmd.ExecuteNonQuery();
            //// The below query will restore database file from disk where backup was taken ....
            //string Restore = @"RESTORE DATABASE
            //       [" + databaseName + "] FROM DISK = N'" +
            //backUpFile + @"' WITH  FILE = 1,  NOUNLOAD,  STATS = 10";
            //SqlCommand RestoreCmd = new SqlCommand(Restore, cn);
            //RestoreCmd.ExecuteNonQuery();
            //// the below query change the database back to multiuser
            //string Alter2 = @"ALTER DATABASE
            //       [" + databaseName + "] SET Multi_User";
            //SqlCommand Alter2Cmd = new SqlCommand(Alter2, cn);
            //Alter2Cmd.ExecuteNonQuery();
            return Json(new
            {
                status = true
            });
        }
    }
}