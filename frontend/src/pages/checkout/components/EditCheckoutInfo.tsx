import { useNavigate } from "react-router-dom";
import { useCheckoutStore } from "../../../store/checkoutStore";

export default function EditCheckoutInfo() {
  const navigate = useNavigate();
  return (
    <div className="px-4 py-2 border mt-6 text-slate-500 text-sm">
      <div className="flex gap-8 border-b pb-2 mb-2">
        <div className="w-[100px]">Name</div>
        <div className="flex-grow">{useCheckoutStore.getState().name}</div>
      </div>

      <div className="flex gap-8 border-b pb-2 mb-2">
        <div className="w-[100px]">Email</div>
        <div className="flex-grow">{useCheckoutStore.getState().email}</div>
      </div>
      <div className="flex gap-8 border-b pb-2 mb-2">
        <div className="w-[100px]">Phone number</div>
        <div className="flex-grow">
          {useCheckoutStore.getState().phoneNumber}
        </div>
        <div
          className="text-blue-500 font-semibold cursor-pointer text-sm"
          onClick={() => {
            navigate("/checkout");
          }}
        >
          Change
        </div>
      </div>
      <div className="flex gap-8">
        <div className="w-[100px]">Address</div>
        <div className="flex-grow">
          {useCheckoutStore.getState().shippingAddress}
        </div>
        <div
          className="text-blue-500 font-semibold cursor-pointer text-sm"
          onClick={() => {
            navigate("/checkout");
          }}
        >
          Change
        </div>
      </div>
    </div>
  );
}
