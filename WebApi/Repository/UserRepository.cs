using Microsoft.EntityFrameworkCore;
using WebApi.Interface;
using WebApi.Models;
using WebApi.Context;

namespace WebApi.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly SewedyContext _context ;
        public UserRepository(SewedyContext context) { _context = context; }

        public async Task<User> GetUserByEmailAsync(string email)
        {
            return await _context.users.FirstOrDefaultAsync(u => u.Email == email);
        }
        public async Task<User> CreateUserAsync(User user)
        {
            _context.users.Add(user);
            await _context.SaveChangesAsync();
            return user;
        }
    }
}
