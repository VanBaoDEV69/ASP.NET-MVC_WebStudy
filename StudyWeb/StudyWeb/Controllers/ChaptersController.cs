using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudyWeb.Models;

namespace StudyWeb.Controllers
{
    public class ChaptersController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Chapters
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var chapter = db.Chapter.Include(c => c.Subjects);
            return View(chapter.ToList());
        }

        // GET: Chapters/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chapter chapter = db.Chapter.Find(id);
            if (chapter == null)
            {
                return HttpNotFound();
            }
            return View(chapter);
        }

        // GET: Chapters/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName");
            return View();
        }

        // POST: Chapters/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idSubjects,chapterName,display")] Chapter chapter)
        {
            if (ModelState.IsValid)
            {
                db.Chapter.Add(chapter);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", chapter.idSubjects);
            return View(chapter);
        }

        // GET: Chapters/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chapter chapter = db.Chapter.Find(id);
            if (chapter == null)
            {
                return HttpNotFound();
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", chapter.idSubjects);
            return View(chapter);
        }

        // POST: Chapters/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idSubjects,chapterName,display")] Chapter chapter)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chapter).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idSubjects = new SelectList(db.Subjects, "id", "subjectName", chapter.idSubjects);
            return View(chapter);
        }

        // GET: Chapters/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chapter chapter = db.Chapter.Find(id);
            if (chapter == null)
            {
                return HttpNotFound();
            }
            return View(chapter);
        }

        // POST: Chapters/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Chapter chapter = db.Chapter.Find(id);
            db.Chapter.Remove(chapter);
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


        public ActionResult ListChapter(int? id)
        {
            List<Chapter> chapters = db.Chapter.Where(s => s.idSubjects == id).ToList();

            // Tạo SelectList
            SelectList ListChapter = new SelectList(db.Chapter, "id", "chapterName");

            // Set vào ViewBag
            ViewBag.ChapterList = ListChapter;


            //ViewBag.idClass = new SelectList(db.Classs, "id", "className",idClass);
            //var subjects = db.Subjects.Where(s => s.idClass == idClass);
            return View(chapters.ToList());
        }


        public ActionResult ListChapterAdmin(int? id)
        {
            List<Chapter> chapters = db.Chapter.Where(s => s.idSubjects == id).ToList();

            // Tạo SelectList
            SelectList ListChapter = new SelectList(db.Chapter, "id", "chapterName");

            // Set vào ViewBag
            ViewBag.ChapterList = ListChapter;


            //ViewBag.idClass = new SelectList(db.Classs, "id", "className",idClass);
            //var subjects = db.Subjects.Where(s => s.idClass == idClass);
            return View(chapters.ToList());
        }

    }
}
