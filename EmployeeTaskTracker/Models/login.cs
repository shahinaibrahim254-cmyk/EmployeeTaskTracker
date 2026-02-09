using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeTaskTracker.Models
{
    public class login
    {
        [Required(ErrorMessage = "Enter the username")]
        public string username { set; get; }
        [Required(ErrorMessage = "Enter the password")]
        public string password { set; get; }
        public string msg { set; get; }
        public string Role { set; get; }
    }
}