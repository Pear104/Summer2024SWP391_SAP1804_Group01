import { Carousel } from "antd";
import { featuredProduct } from "./featuredProduct";

const ProductItem = ({ url, title }: { url: string; title: string }) => {
  return (
    <div className="flex flex-col justify-center items-center border shadow-md py-4 rounded-xl hover:shadow-xl transition-all cursor-pointer">
      {/* <div className="aspect-square w-[300px] bg-slate-400"></div> */}
      <div
        className="aspect-square bg-contain bg-no-repeat flex items-center w-[300px]"
        style={{
          backgroundImage: `url(${url})`,
        }}
      ></div>
      <div className="w-[260px] text-sm mulish-regular flex justify-center text-center text-ellipsis">
        {title}
      </div>
    </div>
  );
};

const ProductItemBlock = ({ products }: { products: any }) => {
  return (
    <div className="mx-6 mt-8 flex gap-4 justify-evenly font-light mulish-regular">
      {products.map((product: any) => (
        <ProductItem
          url={product.accessoryImages[0].url}
          title={product.name}
        />
      ))}
    </div>
  );
};

export default function Explore() {
  return (
    <div className="w-full pb-10">
      <div className="w-full flex justify-center great-vibes-regular text-7xl pt-16">
        Featured products
      </div>
      <Carousel arrows autoplay autoplaySpeed={2000}>
        {/* {featuredProduct.map((product: any, index) => ( */}
        <ProductItemBlock products={featuredProduct.slice(0, 0 + 4)} />
        <ProductItemBlock products={featuredProduct.slice(0, 0 + 4)} />
        <ProductItemBlock products={featuredProduct.slice(0, 0 + 4)} />
        <ProductItemBlock products={featuredProduct.slice(0, 0 + 4)} />
      </Carousel>
    </div>
  );
}
