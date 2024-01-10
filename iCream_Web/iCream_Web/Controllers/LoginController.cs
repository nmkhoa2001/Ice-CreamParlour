using iCream_Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace iCream_Web.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        iCreamEntities db = new iCreamEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Customer_1 log)
        {
            ViewBag.error = "";
            Session["customer_id"] = "";
            
            var  customer_1 = db.Customer_1.Where(x => x.customer_id == log.customer_id && x.customer_pass == log.customer_pass).FirstOrDefault();
            if (customer_1 != null)
            {
                Session["customer_id"] = customer_1.customer_id;
                return RedirectToAction("Hello");
            }
            else
            {
                ViewBag.error = "Invaild Id or Pass";
                return View();
            }

        }

        public ActionResult Hello()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }

        

        

        

       




    }
}