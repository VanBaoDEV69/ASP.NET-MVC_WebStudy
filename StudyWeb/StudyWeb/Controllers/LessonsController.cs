using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudyWeb.Models;

namespace StudyWeb.Controllers
{
    public class LessonsController : Controller
    {
        private StudyWebEntities db = new StudyWebEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            var lesson = db.Lesson.Include(l => l.Chapter);
            return View(lesson.ToList());
        }

        // GET: Lessons/Details/5
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
            Lesson lesson = db.Lesson.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            if (Session["accountAdmin"] == null)
            {
                return RedirectToAction("Login", "Accounts");
            }
            ViewBag.idChapter = new SelectList(db.Chapter, "id", "chapterName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Lesson lesson, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                string _fileName = Path.GetFileName(fileUpload.FileName);
                string _path = Path.Combine(Server.MapPath("~/LessonFile"), _fileName);
                fileUpload.SaveAs(_path);
                lesson.linkLesson = _fileName;
            }
            if (ModelState.IsValid)
            {
                lesson.status = "Chưa học";
                db.Lesson.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("ListLessonAdmin","Lessons", new { id = lesson.idChapter});
            }

            ViewBag.idChapter = new SelectList(db.Chapter, "id", "chapterName", lesson.idChapter);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
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
            Lesson lesson = db.Lesson.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.idChapter = new SelectList(db.Chapter, "id", "chapterName", lesson.idChapter);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idChapter,contentLesson,linkLesson,status,display")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idChapter = new SelectList(db.Chapter, "id", "chapterName", lesson.idChapter);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
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
            Lesson lesson = db.Lesson.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lesson.Find(id);
            db.Lesson.Remove(lesson);
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

        

        public ActionResult ListLesson(int? id)
        {
            List<Lesson> lessons = db.Lesson.Where(s => s.idChapter == id).ToList();

            // Tạo SelectList
            SelectList ListLesson = new SelectList(db.Lesson, "id", "contentLesson","linkLesson");

            // Set vào ViewBag
            ViewBag.LessonList = ListLesson;


            //ViewBag.idClass = new SelectList(db.Classs, "id", "className",idClass);
            //var subjects = db.Subjects.Where(s => s.idClass == idClass);
            return View(lessons.ToList());
        }
        
        public ActionResult Lesson(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lesson.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        public ActionResult ListLessonAdmin(int? id)
        {
            List<Lesson> lessons = db.Lesson.Where(s => s.idChapter == id).ToList();
            SelectList ListLesson = new SelectList(db.Lesson, "id", "contentLesson", "linkLesson");
            ViewBag.LessonList = ListLesson;
            return View(lessons.ToList());
        }

        

    }
}
