using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmployeeTaskTracker.Models;

namespace EmployeeTaskTracker.Controllers
{
    public class AdminController : Controller
    {
        EmployeeTaskTrackerDBEntities db = new EmployeeTaskTrackerDBEntities();

        public ActionResult Admin_Home(string search)
        {
            if (string.IsNullOrEmpty(search))
            {
                var employees = db.sp_GetEmployees()
                    .Select(e => new EmployeeVM
                    {
                        EmployeeId = e.EmployeeId,
                        Name = e.Name,
                        Email = e.Email
                    }).ToList();

                return View(employees);
            }
            else
            {
                var employees = db.sp_SearchEmployees(search)
                    .Select(e => new EmployeeVM
                    {
                        EmployeeId = e.EmployeeId,
                        Name = e.Name,
                        Email = e.Email
                    }).ToList();

                return View(employees);
            }
        }

        public ActionResult AddEmployee_pageload()
        {
            return View();
        }

        public ActionResult AddEmployee_click(Employee emp)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                return RedirectToAction("Login_pageload", "Login");
            }

            if (ModelState.IsValid)
            {
                db.sp_AddEmployee(emp.Name, emp.Email, emp.Username, emp.Password);
                return RedirectToAction("Admin_Home");
            }

            return View("AddEmployee_pageload", emp);
        }

        public ActionResult EditEmployee_Pageload(int id)
        {
            var emp = db.Employees.Find(id);

            if (emp == null)
            {
                return RedirectToAction("Admin_Home");
            }

            EmployeeVM vm = new EmployeeVM
            {
                EmployeeId = emp.EmployeeId,
                Name = emp.Name,
                Email = emp.Email
            };

            return View(vm);
        }

        public ActionResult EditEmployee_click(Employee emp)
        {
            db.sp_UpdateEmployee(emp.EmployeeId, emp.Name, emp.Email);
            return RedirectToAction("Admin_Home");
        }

        public ActionResult DeleteEmployee(int id)
        {
            
            db.sp_DeleteEmployee(id);
            return RedirectToAction("Admin_Home");
        }

        public ActionResult ViewEmployeeTasks(int empId)
        {
            
            var tasks = db.sp_Getemployeetasks(empId).ToList();
           
            return View(tasks);
        }

        
    }
}
