using Helpers.DTOs.AccessoryImage;
using Helpers.DTOs.AccessoryType;
using Helpers.DTOs.Feedback;
using Helpers.DTOs.Shape;

namespace Helpers.DTOs.Accessory
{
    public class AccessoryDTO
    {
        public long AccessoryId { get; set; }
        public int Karat { get; set; }
        public float MaterialWeight { get; set; }
        public string Name { get; set; } = string.Empty;
        public int Quantity { get; set; }
        public AccessoryTypeDTO AccessoryType { get; set; } = new AccessoryTypeDTO();
        public bool IsHidden { get; set; }
        public ShapeDTO Shape { get; set; } = new ShapeDTO();
        public List<AccessoryImageDTO>? AccessoryImages { get; set; } =
            new List<AccessoryImageDTO>();
        public List<FeedbackDTO> Feedbacks { get; set; } = new List<FeedbackDTO>();
    }
}
