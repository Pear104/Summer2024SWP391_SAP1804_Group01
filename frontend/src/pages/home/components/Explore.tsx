import { Carousel } from "antd";
import { featuredProduct } from "./featuredProduct";
import { useState, useEffect } from "react";

const ProductItem = ({ url, title }: { url: string; title: string }) => {
  return (
    <div className="flex flex-col justify-center items-center border shadow-md py-4 rounded-xl hover:shadow-xl transition-all cursor-pointer">
      {/* <div className="aspect-square w-[300px] bg-slate-400"></div> */}
      <div
        className="aspect-square bg-contain bg-no-repeat flex items-center xl:w-[200px] w-[300px]"
        style={{
          backgroundImage: `url(${url})`,
        }}
      ></div>
      <div className="w-[260px] text-[16px] mulish-regular flex justify-center text-center text-ellipsis">
        {title}
      </div>
    </div>
  );
};

const ProductItemBlock = ({ products }: { products: any }) => {
  return (
    <div className="mx-6 mt-8 grid lg:grid-cols-3 grid-cols-5 sm:grid-cols-1 gap-4 justify-evenly mulish-regular">
      {products.map((product: any) => (
        <ProductItem
          url={product.accessoryImages[0].url}
          title={product.name}
        />
      ))}
    </div>
  );
};

const MobileProductItemBlock = ({ products }: { products: any }) => {
  return (
    <div className="mx-6 mt-8 grid sm:grid-cols-1 gap-4 justify-evenly mulish-regular">
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
      <Carousel className="lg:hidden" autoplay autoplaySpeed={3000}>
        {featuredProduct.map((_product: any, index) => {
          if (!(index % 5)) {
            return (
              <ProductItemBlock
                products={featuredProduct.slice(index, index + 5)}
              />
            );
          }
        })}
      </Carousel>
      <span className="sm:hidden">
        <Carousel
          className="sm:bg-black lg:block hidden"
          autoplay
          autoplaySpeed={3000}
        >
          {featuredProduct.map((_product: any, index) => {
            if (!(index % 3)) {
              return (
                <ProductItemBlock
                  products={featuredProduct.slice(index, index + 3)}
                />
              );
            }
          })}
        </Carousel>
      </span>
      <Carousel className="sm:block hidden" autoplay autoplaySpeed={3000}>
        {featuredProduct.map((_product: any, index) => {
          if (!(index % 1)) {
            return (
              <MobileProductItemBlock
                products={featuredProduct.slice(index, index + 1)}
              />
            );
          }
        })}
      </Carousel>
    </div>
  );
}
