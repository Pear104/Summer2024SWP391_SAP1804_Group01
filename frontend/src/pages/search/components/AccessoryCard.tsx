import React from "react";

export default function AccessoryCard({ accessory }: { accessory: any }) {
  return (
    <div className="border border-gray-300 p-4 rounded">
      <img
        src={accessory.accessoryImages[0].url}
        alt={accessory.name}
        className="w-full h-48 object-cover mb-2"
      />
      <h2 className="text-lg font-semibold">{accessory.name}</h2>
      <p className="text-gray-700">{`Karat: ${accessory.karat}`}</p>
      <p className="text-gray-700">{`Weight: ${accessory.materialWeight}g`}</p>
    </div>
  );
}
