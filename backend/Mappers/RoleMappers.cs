using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs;
using backend.Models;

namespace backend.Mappers
{
    public static class RoleMappers
    {
        public static RoleDTO ToRoleDTO(this Role role) 
        {
            return new RoleDTO
            {
                RoleId = role.RoleId,
                RoleName = role.RoleName
            };
        }
        public static Role ToRole(this RoleDTO roleDTO) 
        {
            return new Role
            {
                RoleId = roleDTO.RoleId,
                RoleName = roleDTO.RoleName
            };
        }
    }
}