using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmployeeTaskTracker.Models;


namespace EmployeeTaskTracker.Controllers
{
    public class LoginController : Controller
    {
        EmployeeTaskTrackerDBEntities db = new EmployeeTaskTrackerDBEntities();

        private const string admin_username = "admin";
        private const string admin_password = "admin123";

        public ActionResult Login_pageload()
        {
            return View();
        }

        public ActionResult LoginClick(login clsobj)
        {
            if (ModelState.IsValid)
            {
                if (clsobj.username == admin_username && clsobj.password == admin_password)
                {
                    Session["Role"] = "Admin";
                    return RedirectToAction("Admin_Home","Admin");
                }

                var emp = db.sp_EmployeeLogin(clsobj.username, clsobj.password).FirstOrDefault();
                if (emp != null)
                {
                    Session["Role"] = "Employee";
                    Session["EmployeeId"] =emp.EmployeeId;
                    Session["EmployeeName"] = emp.Name;
                    return RedirectToAction("Employee_Home","Employee");
                }

                else
                {
                    ModelState.Clear();
                    clsobj.msg = "Invalid username or password";
                    clsobj.username = "";
                    return View("Login_PageLoad",clsobj);
                }
            }
          
            return View("Login_pageload", clsobj);


        }


        
    }
}
