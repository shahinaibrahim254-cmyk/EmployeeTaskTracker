using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmployeeTaskTracker.Models;

namespace EmployeeTaskTracker.Controllers
{
    public class TaskController : Controller
    {
        EmployeeTaskTrackerDBEntities db = new EmployeeTaskTrackerDBEntities();
       
        public ActionResult AddTask_pageload(int empId)
        {
            
            Tasks task = new Tasks
            {
                AssignedEmployeeId = empId
            };

            return View(task);
        }

        public ActionResult AddTask_click(Tasks task)
        {
            if (ModelState.IsValid)
            {
                db.sp_AddTask(task.Title, task.Description, task.AssignedEmployeeId);
                TempData["SuccessMessage"] = "Task added successfully!";
                return RedirectToAction("Admin_Home", "Admin");
            }

            return View("AddTask_pageload", task);
        }
        public ActionResult EmployeeTasks()
        {
              int empId = Convert.ToInt32(Session["EmployeeId"]);
              var tasks = db.sp_gettasksbyemployee(empId).ToList();

            return View(tasks);
        }

        public ActionResult UpdateStatus(int taskId)
        {
            db.sp_UpdateTaskStatus(taskId, "Completed");
            return RedirectToAction("EmployeeTasks");
        }
    }
}