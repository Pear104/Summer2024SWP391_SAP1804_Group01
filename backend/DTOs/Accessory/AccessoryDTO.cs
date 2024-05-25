using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.AccessoryImage;
using backend.DTOs.Feedback;
using backend.DTOs.Shape;
using backend.Mappers;

namespace backend.DTOs.Accessory
{
    public class AccessoryDTO
    {
        public long AccessoryId { get; set; }
        public int Karat { get; set; }
        public float MaterialWeight { get; set; }
        public string Name { get; set; } = string.Empty;
        public AccessoryTypeDTO AccessoryType { get; set; } = new AccessoryTypeDTO();
        public ShapeDTO Shape { get; set; } = new ShapeDTO();
        public List<AccessoryImageDTO> AccessoryImages { get; set; } = new List<AccessoryImageDTO>();
        public List<FeedbackDTO> Feedbacks { get; set; } = new List<FeedbackDTO>();
    }
}