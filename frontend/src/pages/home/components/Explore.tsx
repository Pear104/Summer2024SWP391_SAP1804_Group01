const ProductItem = ({ url, title }: { url: string; title: string }) => {
  return (
    <div className="border shadow-md py-4 rounded-xl hover:shadow-xl transition-all">
      {/* <div className="aspect-square w-[300px] bg-slate-400"></div> */}
      <div
        className="aspect-square bg-contain bg-no-repeat flex items-center w-[300px]"
        style={{
          backgroundImage: `url(${url})`,
        }}
      ></div>
      <div className="mt-2 text-xl mulish-regular font-bold flex justify-center">
        {title}
      </div>
    </div>
  );
};

export default function Explore() {
  return (
    <div className="w-full">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Featured products
      </div>
      <div className="mt-8 flex gap-4 justify-evenly">
        <ProductItem
          url="https://www.withclarity.com/cdn/shop/files/RB1501088-ROUND-US7.0-2.50CT-YELLOW-FRONTVIEW_408769b9-103e-4e64-b1db-95222bff95b4_800x.jpg?v=1702874407"
          title="Ring"
        />
        <ProductItem
          url="//www.withclarity.com/cdn/shop/products/EF1551944-YELLOW-FRONTVIEW_400x.jpg?v=1704351602"
          title="Earrings"
        />
        <ProductItem
          url="//www.withclarity.com/cdn/shop/files/nk1551470_4_400x.jpg?v=1698655887"
          title="Necklaces"
        />
        <ProductItem
          url="//www.withclarity.com/cdn/shop/files/BN1552146-YELLOW-FRONTVIEW_150daad8-72cf-4cbf-81f5-4269599e2d7a_400x.jpg?v=1713423679"
          title="Bracelets"
        />
      </div>
    </div>
  );
}
