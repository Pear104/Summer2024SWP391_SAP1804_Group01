import { useMutation, useQueries, useQueryClient } from "@tanstack/react-query";
import { GET, POST } from "../../../utils/request";
import { App, Divider, Input, Modal, Skeleton } from "antd";
import { useState } from "react";
import Loading from "../../../components/Loading";

const color = [
  { value: "D", label: "D" },
  { value: "E", label: "E" },
  { value: "F", label: "F" },
  { value: "G", label: "G" },
  { value: "H", label: "H" },
  { value: "I", label: "I" },
  { value: "J", label: "J" },
  { value: "K", label: "K" },
  { value: "L", label: "L" },
  { value: "M", label: "M" },
];

const clarity = [
  { value: "FL", label: "FL" },
  { value: "IF", label: "IF" },
  { value: "VVS1", label: "VVS1" },
  { value: "VVS2", label: "VVS2" },
  { value: "VS1", label: "VS1" },
  { value: "VS2", label: "VS2" },
  { value: "SI1", label: "SI1" },
  { value: "SI2", label: "SI2" },
  { value: "I1", label: "I1" },
  { value: "I2", label: "I2" },
  { value: "I3", label: "I3" },
];

const carat = [
  [0, 0.3999],
  [0.4, 0.4999],
  [0.5, 0.6999],
  [0.7, 0.8999],
  [0.9, 0.9999],
  [1, 1.4999],
  [1.5, 1.9999],
  [2, 2.9999],
  [3, 3.9999],
  [4, 4.9999],
  [5, 5.9999],
  [6, 7.9999],
];

const DataTable = ({
  diamondPrice,
  carat,
  setIsModalOpen,
  setCurrentUpdateUnitPrice,
}: {
  diamondPrice: any;
  carat: any;
  setIsModalOpen: any;
  setCurrentUpdateUnitPrice: any;
}) => {
  return (
    <div className="w-full flex flex-col justify-center border-b">
      <div className="uppercase text-xl font-semibold text-center mb-4">
        From {carat[0]} carat to {carat[1]} carat
      </div>
      <table className="">
        <thead>
          <tr className="grid grid-cols-12">
            <th className="px-2 font-bold text-center border-b border-black "></th>
            {/* Empty corner cell */}
            {clarity.map((clar) => (
              <th
                className="px-2 py-1 font-bold text-center border-l border-b border-black bg-slate-200"
                key={clar.value}
              >
                {clar.label}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {color.map((col, index: number) => (
            <tr
              key={col.value}
              className="grid grid-cols-12 transition-all duration-100 hover:bg-slate-200"
            >
              <td
                className={`py-2 px-2 font-bold text-center border-b border-black bg-slate-200`}
              >
                {col.label}
              </td>
              {clarity.map((clar) => (
                <td
                  className={`px-2 py-2 text-center cursor-pointer border-b border-l border-black`}
                  key={`${col.value} - ${clar.value}-${carat[0]}-${carat[1]}`}
                  onClick={() => {
                    setCurrentUpdateUnitPrice({
                      minCaratEff: carat[0],
                      maxCaratEff: carat[1],
                      color: col.value,
                      clarity: clar.value,
                      unitPrice: diamondPrice?.find(
                        (price: any) =>
                          price.color == col.value &&
                          price.clarity == clar.value &&
                          price.minCaratEff == carat[0] &&
                          price.maxCaratEff == carat[1]
                      )?.unitPrice,
                    });
                    setIsModalOpen(true);
                  }}
                >
                  {diamondPrice?.find(
                    (price: any) =>
                      price.color == col.value &&
                      price.clarity == clar.value &&
                      price.minCaratEff == carat[0] &&
                      price.maxCaratEff == carat[1]
                  )?.unitPrice || <Skeleton.Button active={true} />}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default function DiamondPriceManage() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [currentUpdateUnitPrice, setCurrentUpdateUnitPrice] = useState<any>({
    minCaratEff: 0,
    maxCaratEff: 0,
    color: "D",
    clarity: "FL",
    unitPrice: 0,
  });
  const queryClient = useQueryClient();
  const { message } = App.useApp();
  const mutation = useMutation({
    mutationFn: (newPrice) => {
      return POST("/api/DiamondPrices", newPrice);
    },
    onSuccess: () => {
      message.success("Unit price updated successfully");
      queryClient.invalidateQueries({ queryKey: ["diamondPrices"] });
    },
    onError: () =>
      queryClient.invalidateQueries({ queryKey: ["diamondPrices"] }),
  });
  const handleOk = () => {
    mutation.mutate(currentUpdateUnitPrice);
    console.log(currentUpdateUnitPrice);
    setIsModalOpen(false);
  };
  const handleCancel = () => {
    setIsModalOpen(false);
  };
  const [diamondPrice] = useQueries({
    queries: [
      {
        queryKey: ["diamondPrices"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
    ],
  });

  return (
    <div className="p-4">
      {mutation.isPending && <Loading />}
      <Modal
        className="w-[400px]"
        centered
        title="Enter new unit price (USD) for: "
        open={isModalOpen}
        onOk={handleOk}
        onCancel={handleCancel}
      >
        <div className="mb-2 tracking-wider">
          <span className="font-bold">
            {currentUpdateUnitPrice.minCaratEff} -{" "}
            {currentUpdateUnitPrice.maxCaratEff.toFixed(2)}
          </span>{" "}
          Carat,{" "}
          <span className="font-bold">{currentUpdateUnitPrice.color}</span>{" "}
          Color,{" "}
          <span className="font-bold">{currentUpdateUnitPrice.clarity}</span>{" "}
          Clarity Diamond
        </div>
        <Input
          value={currentUpdateUnitPrice.unitPrice}
          type="number"
          min={1}
          max={2000}
          onChange={(e) => {
            setCurrentUpdateUnitPrice({
              ...currentUpdateUnitPrice,
              unitPrice: Number(e.target.value),
            });
          }}
          className="border text-base py-2 px-2 without-ring w-full rounded-none"
          placeholder="Unit price"
        />
      </Modal>
      <div className="flex justify-between items-center mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center w-full">
          <Divider
            orientation="center"
            className="text-2xl font-semibold uppercase"
          >
            Diamond Price
          </Divider>
        </div>
      </div>
      <div className="grid gap-8">
        {carat.map((ct: any) => (
          <>
            <DataTable
              key={ct[0]}
              carat={ct}
              diamondPrice={diamondPrice?.data}
              setIsModalOpen={setIsModalOpen}
              setCurrentUpdateUnitPrice={setCurrentUpdateUnitPrice}
            />
            <Divider />
          </>
        ))}
      </div>
    </div>
  );
}
