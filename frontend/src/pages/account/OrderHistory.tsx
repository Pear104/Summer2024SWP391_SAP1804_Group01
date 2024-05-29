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
    </div>
  );
}
