using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Interfaces;
using backend.Models;

namespace backend.Repository
{
    public class RoleRepository : IRoleRepository
    {
        public Task<Role> CreateRoleAsync(Role role)
        {
            throw new NotImplementedException();
        }

        public Task DeleteRoleAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Role>> GetAllRolesAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Role> GetRoleByIdAsync(long id)
        {
            throw new NotImplementedException();
        }

        public Task<Role> UpdateRoleAsync(Role role)
        {
            throw new NotImplementedException();
        }
    }
}