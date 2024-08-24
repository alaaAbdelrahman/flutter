using Microsoft.EntityFrameworkCore;
using WebApi.Context;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Repository
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly SewedyContext _context; 

        public DepartmentRepository(SewedyContext context)
        {
            _context = context;
        }

        public async Task<Department> CreateDepartmentAsync(Department dept)
        {
            _context.Departments.Add(dept);
            await _context.SaveChangesAsync();
            return dept;
        }

        public async Task<Department> DeleteDepartmentAsync(Department dept)
        {

            _context.Departments.Remove(dept);
            await _context.SaveChangesAsync();
            return dept;
        }

        public async Task<Department> EditDepartmentAsync(Department dept, string name, string manager)
        {
            dept.Name = name;
            dept.Manager = manager;
            await _context.SaveChangesAsync();
            return dept;
        }

        public async Task<List<Department>> GetAllDepartmentsAsync()
        {
            return await _context.Departments.ToListAsync();
        }

        public async Task<Department> GetDepartmentByIdAsync(int id)
        {
            return await _context.Departments.FirstOrDefaultAsync(d => d.Id == id);
        }

        public async Task<Department> GetDepartmentByNameAsync(string name)
        {
            return await _context.Departments.FirstOrDefaultAsync(d => d.Name == name);

        }
    }
}
