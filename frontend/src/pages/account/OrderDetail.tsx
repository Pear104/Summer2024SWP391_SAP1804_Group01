import React from "react";

export default function OrderDetail() {
  return (
    <div>
      <ol className="border-l border-neutral-300 dark:border-neutral-500">
        <li>
          <div className="flex-start flex items-center pt-3">
            <div className="-ml-[5px] mr-3 h-[9px] w-[9px] rounded-full bg-neutral-300 dark:bg-neutral-500"></div>
            <p className="text-sm text-neutral-500 dark:text-neutral-300">
              Date (Order placed)
            </p>
          </div>
          <div className="mb-6 ml-4 mt-2">
            <h4 className="mb-1.5 text-xl font-semibold">Order placed</h4>
            <p className="mb-3 text-neutral-500 dark:text-neutral-300">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque
              scelerisque diam non nisi semper, et elementum lorem ornare.
              Maecenas placerat facilisis mollis. Duis sagittis ligula in
              sodales vehicula.
            </p>
          </div>
        </li>
        <li>
          <div className="flex-start flex items-center pt-2">
            <div className="-ml-[5px] mr-3 h-[9px] w-[9px] rounded-full bg-neutral-300 dark:bg-neutral-500"></div>
            <p className="text-sm text-neutral-500 dark:text-neutral-300">
              Date (Payment information confirmation)
            </p>
          </div>
          <div className="mb-6 ml-4 mt-2">
            <h4 className="mb-1.5 text-xl font-semibold">
              Payment Information Confirmation
            </h4>
            <p className="mb-3 text-neutral-500 dark:text-neutral-300">
              Libero expedita explicabo eius fugiat quia aspernatur autem
              laudantium error architecto recusandae natus sapiente sit nam
              eaque, consectetur porro molestiae ipsam an deleniti.
            </p>
          </div>
        </li>
        <li>
          <div className="flex-start flex items-center pt-2">
            <div className="-ml-[5px] mr-3 h-[9px] w-[9px] rounded-full bg-neutral-300 dark:bg-neutral-500"></div>
            <p className="text-sm text-neutral-500 dark:text-neutral-300">
              Date (Assigned to delivery)
            </p>
          </div>
          <div className="ml-4 mt-2 pb-5">
            <h4 className="mb-1.5 text-xl font-semibold">
              Assigned to delivery
            </h4>
            <p className="mb-3 text-neutral-500 dark:text-neutral-300">
              Voluptatibus temporibus esse illum eum aspernatur, fugiat suscipit
              natus! Eum corporis illum nihil officiis tempore. Excepturi illo
              natus libero sit doloremque, laborum molestias rerum pariatur quam
              ipsam necessitatibus incidunt, explicabo.
            </p>
          </div>
        </li>
        <li>
          <div className="flex-start flex items-center pt-2">
            <div className="-ml-[5px] mr-3 h-[9px] w-[9px] rounded-full bg-neutral-300 dark:bg-neutral-500"></div>
            <p className="text-sm text-neutral-500 dark:text-neutral-300">
              Date (Product received)
            </p>
          </div>
          <div className="ml-4 mt-2 pb-5">
            <h4 className="mb-1.5 text-xl font-semibold">Product received</h4>
            <p className="mb-3 text-neutral-500 dark:text-neutral-300">
              Voluptatibus temporibus esse illum eum aspernatur, fugiat suscipit
              natus! Eum corporis illum nihil officiis tempore. Excepturi illo
              natus libero sit doloremque, laborum molestias rerum pariatur quam
              ipsam necessitatibus incidunt, explicabo.
            </p>
          </div>
        </li>
      </ol>
      <div className="flex justify-center items-center">
        <a
          className="mt-10 w-32 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer -ml-2 mr-10"
          href="#"
        >
          Evaluating
        </a>
        <a
          className="mt-10 w-32 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer"
          href="#"
        >
          Back
        </a>
      </div>
    </div>
  );
}
