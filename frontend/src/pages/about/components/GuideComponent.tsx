export default function GuideComponent() {
  return (
    <div
      id="how-to-buy"
      className="mb-8 bg-slate-100 p-14 border border-gray-300 rounded-md"
    >
      <h2 className="text-4xl font-bold mb-16 text-red-500">How to Buy</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div className="mb-4">
          {/* <img
            src="https://source.unsplash.com/600x400/?jewelry,collection"
            alt="Browse Our Collection"
            className="mb-4 w-full rounded-md"
          /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 1: Browse Our Collection
          </h3>
          <p className="text-gray-700 pl-5">
            Visit our online store or come to our showroom to explore our wide
            range of diamonds and jewelry. Our experts are available to assist
            you in finding the perfect piece.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
            src="https://source.unsplash.com/600x400/?diamond"
            alt="Select Your Diamond"
            className="mb-4 w-full rounded-md"
          /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 2: Select Your Diamond
          </h3>
          <p className="text-gray-700 pl-5">
            Choose the diamond that fits your preferences and budget. Our
            gemologists will provide you with detailed information and guidance.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
            src="https://source.unsplash.com/600x400/?custom,jewelry"
            alt="Customize Your Jewelry"
            className="mb-4 w-full rounded-md"
          /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 3: Customize Your Jewelry
          </h3>
          <p className="text-gray-700 pl-5">
            Work with our designers to customize your jewelry. Whether it’s a
            unique setting or personalized engraving, we ensure your vision
            comes to life.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
            src="https://source.unsplash.com/600x400/?payment,delivery"
            alt="Secure Payment and Delivery"
            className="mb-4 w-full rounded-md"
          /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 4: Secure Payment and Delivery
          </h3>
          <p className="text-gray-700 pl-5">
            Complete your purchase through our secure payment process. We offer
            insured shipping and in-store pickup options for your convenience.
          </p>
        </div>
        <div className="flex justify-center items-center md:col-span-2">
          <a
            className="bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer py-2 px-4"
            href="/product/diamond"
          >
            Shopping Now
          </a>
        </div>
      </div>
    </div>
  );
}
