using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.DTOs
{
    public class RoleDTO
    {
        public long RoleId { get; set; }

        public string RoleName { get; set; } = string.Empty;
        public List<AccountDTO> Accounts { get; set; } = new List<AccountDTO>();
    }
}