const OpenGoogleMaps = ({ address }: { address: string }) => {
  return (
    <a
      href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(
        address
      )}`}
      target="_blank"
      rel="noopener noreferrer"
      className="text-sm border p-2 bg-green-500 text-white rounded-lg"
    >
      {address}
    </a>
  );
};

export default OpenGoogleMaps;
