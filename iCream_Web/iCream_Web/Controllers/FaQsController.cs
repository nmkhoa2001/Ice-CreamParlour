using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using iCream_Web.Models;

namespace iCream_Web.Controllers
{
    public class FaQsController : Controller
    {
        private iCreamEntities db = new iCreamEntities();

        // GET: FaQs
        public ActionResult Index()
        {
            return View(db.FaQs.ToList());
        }

        // GET: FaQs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FaQ faQ = db.FaQs.Find(id);
            if (faQ == null)
            {
                return HttpNotFound();
            }
            return View(faQ);
        }

        // GET: FaQs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FaQs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "faq_id,faq_type,faq_nameViewer,faq_email,faq_phone,faq_text")] FaQ faQ)
        {
            if (ModelState.IsValid)
            {
                db.FaQs.Add(faQ);
                db.SaveChanges();
                return RedirectToAction("ThankYou");
            }

            return View(faQ);
        }

        public ActionResult ThankYou()
        {
            return View();
        }




        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
