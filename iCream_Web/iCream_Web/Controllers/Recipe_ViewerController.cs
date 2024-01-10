using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using iCream_Web.Models;

namespace iCream_Web.Controllers
{
    public class Recipe_ViewerController : Controller
    {
        private iCreamEntities db = new iCreamEntities();

        // GET: Recipe_Viewer
        public ActionResult Index()
        {
            var recipe_Viewer = db.Recipe_Viewer.Include(r => r.Category_Recipe);
            return View(recipe_Viewer.ToList());
        }

        // GET: Recipe_Viewer/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recipe_Viewer recipe_Viewer = db.Recipe_Viewer.Find(id);
            if (recipe_Viewer == null)
            {
                return HttpNotFound();
            }
            return View(recipe_Viewer);
        }

        // GET: Recipe_Viewer/Create
        public ActionResult Create()
        {
            ViewBag.caterory_name = new SelectList(db.Category_Recipe, "category_name", "category_name");
            return View();
        }

        // POST: Recipe_Viewer/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "recipeV_id,caterory_name,recipeV_nameViewer,recipeV_name,recipeV_price,recipeV_img,recipeV_imgFile,recipe_status,recipeV_text")] Recipe_Viewer recipe_Viewer)
        {
            if (recipe_Viewer.recipeV_imgFile.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(recipe_Viewer.recipeV_imgFile.FileName);
                if (fileExtension == ".png" || fileExtension == ".jpg" || fileExtension == ".jpeg")
                {
                    string upfileFolder = Server.MapPath("~/UploadsViewer");
                    if (Directory.Exists(upfileFolder) == false)
                    {
                        Directory.CreateDirectory(upfileFolder);
                    }

                    string newFileName = (recipe_Viewer.recipeV_imgFile.FileName);
                    string filePath = Path.Combine(upfileFolder, newFileName);
                    recipe_Viewer.recipeV_imgFile.SaveAs(filePath);

                    recipe_Viewer.recipeV_img = newFileName;
                }
            }

            if (ModelState.IsValid)
            {
                db.Recipe_Viewer.Add(recipe_Viewer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.caterory_name = new SelectList(db.Category_Recipe, "category_name", "category_name", recipe_Viewer.caterory_name);
            return View(recipe_Viewer);
        }

        // GET: Recipe_Viewer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recipe_Viewer recipe_Viewer = db.Recipe_Viewer.Find(id);
            if (recipe_Viewer == null)
            {
                return HttpNotFound();
            }
            ViewBag.caterory_name = new SelectList(db.Category_Recipe, "category_name", "category_name", recipe_Viewer.caterory_name);
            return View(recipe_Viewer);
        }

        // POST: Recipe_Viewer/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "recipeV_id,caterory_name,recipeV_nameViewer,recipeV_name,recipeV_price,recipeV_img,recipe_status,recipeV_text")] Recipe_Viewer recipe_Viewer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recipe_Viewer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.caterory_name = new SelectList(db.Category_Recipe, "category_name", "category_name", recipe_Viewer.caterory_name);
            return View(recipe_Viewer);
        }

        // GET: Recipe_Viewer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recipe_Viewer recipe_Viewer = db.Recipe_Viewer.Find(id);
            if (recipe_Viewer == null)
            {
                return HttpNotFound();
            }
            return View(recipe_Viewer);
        }

        // POST: Recipe_Viewer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Recipe_Viewer recipe_Viewer = db.Recipe_Viewer.Find(id);
            db.Recipe_Viewer.Remove(recipe_Viewer);
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
