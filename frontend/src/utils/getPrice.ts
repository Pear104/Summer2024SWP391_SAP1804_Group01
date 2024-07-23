export const getDiamondPrice = (
  diamond: any,
  diamondPrice: any,
  priceRate: any
) => {
  return (
    diamond?.carat *
    diamondPrice?.find(
      (price: any) =>
        diamond?.color == price.color &&
        diamond?.clarity == price.clarity &&
        price.minCaratEff <= diamond?.carat &&
        diamond?.carat <= price.maxCaratEff
    )?.unitPrice *
    5 *
    priceRate
  );
};

export const getOrderDiamondPrice = (
  diamond: any,
  diamondPrice: any,
  priceRate: any
) => {
  return diamond?.carat * diamondPrice.unitPrice * 5 * priceRate;
};

export const getAccessoryPrice = (
  accessory: any,
  materialPrice: any,
  size: any,
  priceRate: any
) => {
  return (
    ((accessory?.materialWeight + (size - 3)) *
      materialPrice?.find((price: any) => price.karat == accessory?.karat)
        ?.unitPrice +
      accessory?.accessoryType?.processingPrice) *
    priceRate
  );
};

export const getOrderAccessoryPrice = (
  accessory: any,
  materialPrice: any,
  size: any,
  priceRate: any
) => {
  return (
    ((accessory?.materialWeight + (size - 3)) * materialPrice?.unitPrice +
      accessory?.accessoryType?.processingPrice) *
    priceRate
  );
};
