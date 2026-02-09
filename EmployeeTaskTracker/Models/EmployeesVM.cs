using System.ComponentModel.DataAnnotations;

namespace EmployeeTaskTracker.Models
{
    public class EmployeeVM
    {
        public int EmployeeId { get; set; }

        [Required(ErrorMessage = "Enter employee name")]
        public string Name { get; set; } 

        [Required(ErrorMessage = "Enter email")]
        [EmailAddress(ErrorMessage = "Enter valid email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Enter username")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Enter password")]
      
        public string Password { get; set; }
    }
}
