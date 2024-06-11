export const getDiamondPrice = (diamond: any, diamondPrice: any) => {
  return (
    diamond?.carat *
    diamondPrice?.find(
      (price: any) =>
        diamond?.color == price.color &&
        diamond?.clarity == price.clarity &&
        price.minCaratEff <= diamond?.carat &&
        diamond?.carat <= price.maxCaratEff
    )?.unitPrice *
    100
  );
};

export const getAccessoryPrice = (
  accessory: any,
  materialPrice: any,
  size: any
) => {
  return (
    (accessory?.materialWeight + (size - 3)) *
    materialPrice?.find((price: any) => price.karat == accessory?.karat)
      ?.unitPrice
  );
};
