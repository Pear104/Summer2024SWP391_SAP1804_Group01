export default function Test() {
  return (
    <div className="grid grid-cols-3">
      <div className="relative aspect-square w-full">
        <div
          className="opacity-25 filtered z-10 absolute my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
          style={{
            backgroundImage: `url(https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930)`,
          }}
        ></div>
        <div
          className="absolute my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
          style={{
            backgroundImage: `url(https://www.withclarity.com/cdn/shop/products/RB1502007-ROUND-YELLOW-FRONTVIEW_52a52033-b87e-47b7-91d6-b4e2a1faf99b_800x.jpg?v=1690889930)`,
          }}
        ></div>
      </div>
    </div>
  );
}
