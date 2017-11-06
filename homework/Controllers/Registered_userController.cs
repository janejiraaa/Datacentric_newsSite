using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using homework.Models;

namespace homework.Controllers
{
    public class Registered_userController : Controller
    {
        private newsContainer db = new newsContainer();

        // GET: Registered_user
        public ActionResult Index()
        {
            return View(db.Registered_user.ToList());
        }

        // GET: Registered_user/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registered_user registered_user = db.Registered_user.Find(id);
            if (registered_user == null)
            {
                return HttpNotFound();
            }
            return View(registered_user);
        }

        // GET: Registered_user/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Registered_user/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "User_id,Email_id,Password_user")] Registered_user registered_user)
        {
            if (ModelState.IsValid)
            {
                db.Registered_user.Add(registered_user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(registered_user);
        }

        // GET: Registered_user/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registered_user registered_user = db.Registered_user.Find(id);
            if (registered_user == null)
            {
                return HttpNotFound();
            }
            return View(registered_user);
        }

        // POST: Registered_user/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "User_id,Email_id,Password_user")] Registered_user registered_user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registered_user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(registered_user);
        }

        // GET: Registered_user/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registered_user registered_user = db.Registered_user.Find(id);
            if (registered_user == null)
            {
                return HttpNotFound();
            }
            return View(registered_user);
        }

        // POST: Registered_user/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Registered_user registered_user = db.Registered_user.Find(id);
            db.Registered_user.Remove(registered_user);
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
