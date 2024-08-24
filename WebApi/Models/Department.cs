using System.ComponentModel.DataAnnotations;

namespace WebApi.Models
{
    public class Department
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Manager { get; set; }
        
    }
}
