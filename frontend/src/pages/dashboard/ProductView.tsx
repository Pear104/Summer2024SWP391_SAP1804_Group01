import React from "react";

export default function ProductView() {
  return (
    <div className="p-4">
      <div className="flex justify-between items-center">
        <div className="flex justify-start scpace-x-1 items-center">
          <div className="self-center">
            <h1 className=""> Produts</h1>
          </div>
        </div>
        <div className="flex justify-end scpace-x-1 items-center">
          <a href="/admin/products/new" className="button primary">
            <span>New Product</span>
          </a>
        </div>
      </div>
    </div>
  );
}
