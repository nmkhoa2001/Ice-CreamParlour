using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using iCream_Admin.Models;

namespace iCream_Admin.Controllers
{
    public class BooksController : Controller
    {
        private iCreamEntities db = new iCreamEntities();

        // GET: Books
        public ActionResult Index()
        {
            return View(db.Books.ToList());
        }

        // GET: Books/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.Books.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // GET: Books/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "book_id,book_name,book_discount,book_price,book_quantity,book_img,book_imgFile")] Book book)
        {
            if (book.book_imgFile.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(book.book_imgFile.FileName);
                if (fileExtension == ".png" || fileExtension == ".jpg" || fileExtension == ".jpeg")
                {
                    string upfileFolder = Server.MapPath("~/UploadsBook");
                    if (Directory.Exists(upfileFolder) == false)
                    {
                        Directory.CreateDirectory(upfileFolder);
                    }

                    string newFileName = (book.book_imgFile.FileName);
                    string filePath = Path.Combine(upfileFolder, newFileName);
                    book.book_imgFile.SaveAs(filePath);

                    book.book_img = newFileName;
                }
            }
            if (ModelState.IsValid)
            {
                db.Books.Add(book);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(book);
        }

        // GET: Books/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.Books.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "book_id,book_name,book_discount,book_price,book_quantity,book_img,book_imgFile")] Book book)
        {
            if (book.book_imgFile.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(book.book_imgFile.FileName);
                if (fileExtension == ".png" || fileExtension == ".jpg" || fileExtension == ".jpeg")
                {
                    string upfileFolder = Server.MapPath("~/UploadsBook");
                    if (Directory.Exists(upfileFolder) == false)
                    {
                        Directory.CreateDirectory(upfileFolder);
                    }

                    string newFileName = (book.book_imgFile.FileName);
                    string filePath = Path.Combine(upfileFolder, newFileName);
                    book.book_imgFile.SaveAs(filePath);

                    book.book_img = newFileName;
                }
            }
            if (ModelState.IsValid)
            {
                db.Entry(book).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(book);
        }

        // GET: Books/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.Books.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Book book = db.Books.Find(id);
            db.Books.Remove(book);
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
