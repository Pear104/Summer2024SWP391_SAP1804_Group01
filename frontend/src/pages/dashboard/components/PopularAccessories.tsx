import classNames from "classnames";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { GET } from "../../../utils/request";
import { getAccessoryPrice } from "../../../utils/getPrice";
import { useQueries } from "@tanstack/react-query";

function PopularAccessories() {
  const [data, setData] = useState<
    {
      id: string;
      accessory_name: string;
      accessory_thumbnail: string;
      accessory_price: string;
      accessory_stock: number;
    }[]
  >([]);
  const [materialPrices, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["materialPrices"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
        staleTime: Infinity,
      },
    ],
  });
  useEffect(() => {
    const fetchData = async () => {
      const fetchData = await GET("/api/Report/AccessoryReport");
      console.log(fetchData);
      const mappedData = fetchData?.map((accessory: any) => ({
        id: accessory.accessoryId,
        accessory_name: accessory.name,
        accessory_thumbnail:
          accessory?.accessoryImages.length > 0
            ? accessory?.accessoryImages[0].url
            : "https://www.globalsign.com/application/files/9516/0389/3750/What_Is_an_SSL_Common_Name_Mismatch_Error_-_Blog_Image.jpg",
        accessory_price: getAccessoryPrice(
          accessory,
          materialPrices?.data,
          3,
          priceRate?.data?.percent
        ),
        // accessory_price: accessory.accessory_price,
        accessory_stock: accessory.quantity,
      }));
      setData(mappedData);
    };
    fetchData();
  }, []);
  console.log("Popular Accessories data");
  console.log(data);
  return (
    <div className="w-[20rem] bg-white p-4 rounded-sm border border-gray-200">
      <strong className="text-gray-700 font-medium">Popular Accessories</strong>
      <div className="mt-4 flex flex-col gap-3">
        {data.map((product) => (
          <Link
            key={product.id}
            to={`/admin/accessories/detail/${product.id}`}
            className="flex items-start hover:no-underline"
          >
            <div className="w-10 h-10 min-w-[2.5rem] bg-gray-200 rounded-sm">
              <img
                className="w-full h-full object-cover rounded-sm"
                src={product.accessory_thumbnail}
                alt={product.accessory_name}
              />
            </div>
            <div className="ml-4 flex-1">
              <p className="text-sm text-gray-800">{product.accessory_name}</p>
              <span
                className={classNames(
                  product.accessory_stock === 0
                    ? "text-red-500"
                    : product.accessory_stock > 50
                    ? "text-green-500"
                    : "text-orange-500",
                  "text-xs font-medium"
                )}
              >
                {product.accessory_stock === 0
                  ? "Out of Stock"
                  : product.accessory_stock + " in Stock"}
              </span>
            </div>
            <div className="text-xs text-gray-400 pl-1.5">
              {product?.accessory_price.toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}

export default PopularAccessories;
