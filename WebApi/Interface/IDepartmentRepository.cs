using WebApi.Models;

namespace WebApi.Interface
{
    public interface IDepartmentRepository
    {
        Task<Department> GetDepartmentByIdAsync(int id);
        Task<Department> GetDepartmentByNameAsync(string name);
        Task<Department> CreateDepartmentAsync(Department dept);
        Task<List<Department>> GetAllDepartmentsAsync();
        Task<Department> EditDepartmentAsync(Department dept, string name, string manager);
        Task<Department> DeleteDepartmentAsync(Department dept);
    }
}
