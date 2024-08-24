using Microsoft.EntityFrameworkCore;

using WebApi.Models;

namespace WebApi.Context
{
    public class SewedyContext : DbContext
    {

        public SewedyContext()
        {

        }
        public SewedyContext(DbContextOptions options) : base(options)
        {

        }
        public DbSet<User> users { get; set; }
        public DbSet<Department> Departments { get; set; }
    }
}
