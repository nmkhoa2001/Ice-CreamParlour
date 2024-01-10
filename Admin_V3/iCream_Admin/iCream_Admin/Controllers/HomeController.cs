using iCream_Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;

namespace iCream_Admin.Controllers
{
    public class HomeController : Controller
    {
        iCreamEntities db = new iCreamEntities();
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Index(Admin log)
        {
            ViewBag.error = "";
            var Admin = db.Admins.Where(x => x.admin_id == log.admin_id && x.admin_pass == log.admin_pass).FirstOrDefault();
            if (Admin != null)
            {
                

                return RedirectToAction("Manager");
            }
            else
            {
                ViewBag.error = "Invaild Id or PassWord";
                return View();
            }
        }
        public ActionResult Manager()
        {
            return View();
        }
    }


}