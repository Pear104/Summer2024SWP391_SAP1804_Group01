using backend.DTOs;
using backend.DTOs.Diamond;
using backend.Models;

namespace backend.Mappers
{
    public static class DiamondMapper
    {
        public static DiamondDTO ToDiamondDTO(this Diamond diamond)
        {
            return new DiamondDTO
            {
                DiamondId = diamond.DiamondId,
                Lab = diamond.Lab,
                CertificateNumber = diamond.CertificateNumber,
                CertificateUrl = diamond.CertificateUrl,
                ImageUrl = diamond.ImageUrl,
                Carat = diamond.Carat,
                Cut = diamond.Cut,
                Clarity = diamond.Clarity.ToString(),
                Color = diamond.Color.ToString(),
                Polish = diamond.Polish,
                Symmetry = diamond.Symmetry,
                Fluorescence = diamond.Fluorescence,
                Availability = diamond.Availability,
                IsHidden = diamond.IsHidden,
                Shape = diamond.Shape.Name,
                ShapeId = diamond.ShapeId
            };
        }

        public static Diamond ToDiamondFromCreate(this CreateDiamondDTO diamondDto)
        {
            return new Diamond
            {
                Lab = diamondDto.Lab,
                CertificateNumber = diamondDto.CertificateNumber,
                CertificateUrl = diamondDto.CertificateUrl,
                ImageUrl = diamondDto.ImageUrl,
                Carat = diamondDto.Carat,
                Cut = diamondDto.Cut,
                Clarity = diamondDto.Clarity,
                Color = diamondDto.Color,
                Polish = diamondDto.Polish,
                Symmetry = diamondDto.Symmetry,
                Fluorescence = diamondDto.Fluorescence,
                Availability = diamondDto.Availability,
                ShapeId = diamondDto.ShapeId,
            };
        }
    }
}
