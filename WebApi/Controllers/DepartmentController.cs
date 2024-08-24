using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi.Context;
using WebApi.Interface;
using WebApi.Models;
using WebApi.Repository;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentController : ControllerBase
    {
        private readonly SewedyContext _context;
        private readonly IDepartmentRepository _deptService;

        public DepartmentController(SewedyContext context, IDepartmentRepository dept)
        {
            _context = context;
            _deptService = dept;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            List<Department> DeptList = await _deptService.GetAllDepartmentsAsync();
            return Ok(DeptList);
        }
        //[route pattern, route name]
        [HttpGet("{id:int}", Name= "GetoneDeptRoute")] //api/Department/id

        public async Task<IActionResult> GetByID(int id)
        {
            Department Dept = await _deptService.GetDepartmentByIdAsync(id);
            return Ok(Dept);
        }

        [HttpGet("{name:alpha}")] //api/Department/{id}
        //[Route("{id}")]
        public async Task<IActionResult> GetByName(string name)
        {
            Department Dept = await _deptService.GetDepartmentByNameAsync(name);
            return Ok(Dept);
        }

        [HttpPost]
        public async Task<IActionResult> Add(Department dept)
        {
            if (ModelState.IsValid)
            {
                //201 Create ==> Location, response"with object"
                Department newDept = await _deptService.CreateDepartmentAsync(dept);
                string url = Url.Link("GetONeDeptRoute", new { id = dept.Id });
                return Created(url, dept);
            }
            return BadRequest(ModelState);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update([FromRoute]int id, [FromBody] Department dept)
        {
            if(ModelState.IsValid)
            {
                Department OldDept = await _deptService.GetDepartmentByIdAsync(id);
                if (OldDept != null)
                {
                    _deptService.EditDepartmentAsync(OldDept, dept.Name, dept.Manager);
                    return StatusCode(204, "Data Saved");
                }
                return BadRequest("Id is not valid");
            }
            return BadRequest(ModelState);
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Remove(int id)
        {
            Department OldDept = await _deptService.GetDepartmentByIdAsync(id);
            if(OldDept != null)
            {
                try
                {
                    _deptService.DeleteDepartmentAsync(OldDept);
                    return StatusCode(204, "Record Remove Success");
                }catch(Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }
            return BadRequest("Id Not Found");

        }
    }
}
