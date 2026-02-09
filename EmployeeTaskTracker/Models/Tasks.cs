using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeTaskTracker.Models
{
    public class Tasks
    {

        public int TaskId { get; set; }

        [Required(ErrorMessage = "Enter task title")]
        public string Title { get; set; }

        [Required(ErrorMessage = "Enter task description")]
        public string Description { get; set; }

        public int AssignedEmployeeId { get; set; }

        public string Status { get; set; }

    }
}