import React from 'react';


const CartItem = ({ product }: { product: any }) => {
  return (
    <div className="flex items-center p-5 border-b border-gray-300">
        {/* Product image */}
      <img
        src={product.image}
        alt={product.title}
        className="w-40 h-auto mr-5"
      />
      {/* Product details */}
      <div className="flex-grow">
        <h2 className="text-lg font-medium mb-2">{product.title}</h2>
        <p className="text-green-600 text-base mb-2">
          Free <span className="line-through text-gray-600 ml-2">${product.originalPrice}</span>
        </p>
        <p className="mb-2">
          <strong>METAL COLOR :</strong> {product.metalColor}
        </p>
        <p className="mb-2">
          <strong>DIAMOND TYPE :</strong> {product.diamondType}
        </p>
        <p className="mb-2">
          <strong>TOTAL CARAT WEIGHT :</strong> {product.caratWeight}
        </p>
        <p className="text-gray-600 mb-4">Track your order in real time before it ships</p>
        <div className="flex items-center">
          <label htmlFor={`quantity-${product.id}`} className="mr-2">Quantity:</label>
          <input type="number" id={`quantity-${product.id}`} name="quantity" min="1" defaultValue="1" className="w-16 p-1 border border-gray-400 rounded" />
        </div>
      </div>
    </div>
  );
};

export default CartItem;