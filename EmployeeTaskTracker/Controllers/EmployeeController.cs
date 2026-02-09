using System;
using System.Linq;
using System.Web.Mvc;
using EmployeeTaskTracker.Models;

namespace EmployeeTaskTracker.Controllers
{
    public class EmployeeController : Controller
    {
        EmployeeTaskTrackerDBEntities db = new EmployeeTaskTrackerDBEntities();
        public ActionResult Employee_Home()
        {
            
                int empId = Convert.ToInt32(Session["EmployeeId"]);
                var tasks = db.sp_gettasksbyemployee(empId).ToList();
                
            
            return View(tasks);

        }
        public ActionResult MarkCompleted(int taskId)
        {
            db.sp_UpdateTaskStatus(taskId, "Completed");
            return RedirectToAction("Employee_Home");
        }
    }
}

