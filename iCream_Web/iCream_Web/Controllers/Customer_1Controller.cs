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
    public class Customer_1Controller : Controller
    {
        private iCreamEntities db = new iCreamEntities();

        // GET: Customer_1
        public ActionResult Index()
        {
            return View(db.Customer_1.ToList());
        }

        // GET: Customer_1/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer_1 customer_1 = db.Customer_1.Find(id);
            if (customer_1 == null)
            {
                return HttpNotFound();
            }
            return View(customer_1);
        }

        // GET: Customer_1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customer_1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "customer_id,customer_name,customer_pass,customer_repass,customer_email,customer_birthday,customer_status,customer_cardNumber,customer_cardsName,customer_cardCVV")] Customer_1 customer_1)
        {
            if (ModelState.IsValid)
            {
                db.Customer_1.Add(customer_1);
                db.SaveChanges();
                return RedirectToAction("ThankYou");
            }

            return View(customer_1);
        }

        // GET: Customer_1/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer_1 customer_1 = db.Customer_1.Find(id);
            if (customer_1 == null)
            {
                return HttpNotFound();
            }
            return View(customer_1);
        }

        // POST: Customer_1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "customer_id,customer_name,customer_pass,customer_repass,customer_email,customer_birthday,customer_status,customer_cardNumber,customer_cardsName,customer_cardCVV")] Customer_1 customer_1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer_1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customer_1);
        }

        // GET: Customer_1/Delete/5

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
