import React, { useState } from 'react';
import { Button } from 'antd';
import CartItem from './components/CartItem';
import Information from './components/Information';
function Cart() {

  const products = [
    {
      id: 1,
      title: 'Free 1/2 CTTW Stud Tulip Earrings',
      image: 'images/showcase.jpg',
      originalPrice: 0,
      metalColor: 'White',
      diamondType: 'Lab',
      caratWeight: '1/2',
    }, {
      id: 2,
      title: '1.0 Carat Emerald Lab Diamond',
      image: 'images/showcase.jpg',
      originalPrice: 462,
      metalColor: 'White',
      diamondType: 'Lab',
      caratWeight: '1/2',
    }
  ];


  const totalPrice = products.reduce((total, item) => total + item.originalPrice, 0);

  return (

    <div className="flex">
      {/* Cart items */}
      <div className="w-3/4 p-4 m-4">
        {/* Cart header */}
        <h1 className="text-5xl mb-5 text-bold">Your Cart</h1>
        {/* Cart items */}
        <div className="max-w-4xl mx-auto p-5">
          {products.map(product => (
            <CartItem key={product.id} product={product} />
          ))}
        </div>
      </div>
      {/* Order summary */}

      <div className="w-1/4 p-4 bg-gray-100">
        <div className='max-w-md mx-auto border border-gray-400 p-6 rounded-lg'>
          <h2 className="text-3xl mb-4 text-center">Order Summary</h2>
          <div className="flex justify-between items-center">
            <span className="font-bold">Total:</span>
            <span className="font-bold">${totalPrice.toFixed(2)}</span>
          </div>
          <p className="text-gray-500 mb-4 text-center">Taxes and shipping calculated at checkout</p>
          {/* Checkout*/}
          <Button
            className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
            type="default"
          >
            CHECK OUT
          </Button>

          <Information />
        </div>
      </div>
    </div>
  );
}

export default Cart;