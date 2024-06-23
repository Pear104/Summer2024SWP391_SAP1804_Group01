export default function DiamondCard({ diamond }: { diamond: any }) {
  return (
    <div className="border border-gray-300 p-4 rounded">
      <img
        src={diamond.imageUrl}
        alt={`Diamond ${diamond.diamondId}`}
        className="w-full h-48 object-cover mb-2"
      />
      <h2 className="text-lg font-semibold">{`Diamond ${diamond.certificateNumber}`}</h2>
      <p className="text-gray-700">{`${diamond.carat} Carat`}</p>
      <p className="text-gray-700">{diamond.color}</p>
      <p className="text-gray-700">{diamond.clarity}</p>
    </div>
  );
}
