using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using iCream_Admin.Models;

namespace iCream_Admin.Controllers
{
    public class Category_RecipeController : Controller
    {
        private iCreamEntities db = new iCreamEntities();

        // GET: Category_Recipe
        public ActionResult Index()
        {
            return View(db.Category_Recipe.ToList());
        }

        // GET: Category_Recipe/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category_Recipe category_Recipe = db.Category_Recipe.Find(id);
            if (category_Recipe == null)
            {
                return HttpNotFound();
            }
            return View(category_Recipe);
        }

        // GET: Category_Recipe/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Category_Recipe/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "category_name,category_id")] Category_Recipe category_Recipe)
        {
            if (ModelState.IsValid)
            {
                db.Category_Recipe.Add(category_Recipe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category_Recipe);
        }

        // GET: Category_Recipe/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category_Recipe category_Recipe = db.Category_Recipe.Find(id);
            if (category_Recipe == null)
            {
                return HttpNotFound();
            }
            return View(category_Recipe);
        }

        // POST: Category_Recipe/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "category_name,category_id")] Category_Recipe category_Recipe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category_Recipe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category_Recipe);
        }

        // GET: Category_Recipe/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category_Recipe category_Recipe = db.Category_Recipe.Find(id);
            if (category_Recipe == null)
            {
                return HttpNotFound();
            }
            return View(category_Recipe);
        }

        // POST: Category_Recipe/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Category_Recipe category_Recipe = db.Category_Recipe.Find(id);
            db.Category_Recipe.Remove(category_Recipe);
            db.SaveChanges();
            return RedirectToAction("Index");
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
