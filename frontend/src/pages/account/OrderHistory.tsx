import React from "react";

export default function OrderHistory() {
  return (
    <div className="divide-y">
      <div className="Order-header libre-baskerville-regular mb-6">
        ORDER HISTORY
      </div>
      <div className="Order-body">
        <p className="border-solid border-2 border-slate-400 p-5">
          You haven't placed any orders yet
        </p>
      </div>
      <div>hehe</div>
      <div>
        <div className="flex justify-center mt-10">
          <div className="w-96 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer">
            Continue Shopping
          </div>
        </div>
      </div>
    </div>
  );
}
