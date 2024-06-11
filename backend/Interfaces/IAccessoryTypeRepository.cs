using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.AccessoryType;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccessoryTypeRepository
    {
        Task<IEnumerable<AccessoryType>> GetAllAccessoryTypesAsync();
        Task<AccessoryType?> GetAccessoryTypeByIdAsync(long id);
        Task<AccessoryType?> CreateAccessoryTypeAsync(CreateAccessoryTypeDTO accessoryTypeDto);
        Task<AccessoryType?> UpdateAccessoryTypeAsync(
            long id,
            UpdateAccessoryTypeDTO accessoryTypeDto
        );
        Task<AccessoryType?> DeleteAccessoryTypeAsync(long id);
    }
}
