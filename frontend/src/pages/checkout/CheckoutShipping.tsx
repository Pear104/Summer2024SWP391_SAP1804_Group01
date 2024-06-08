import { ArrowLeftOutlined } from "@ant-design/icons";
import { Button } from "antd";
import { useNavigate } from "react-router-dom";
import EditCheckoutInfo from "./components/EditCheckoutInfo";

export default function CheckoutShipping() {
  const navigate = useNavigate();
  return (
    <div className="">
      <EditCheckoutInfo />

      <div className="flex justify-between items-center mt-8">
        <div
          className="text-lg text-blue-500 hover:text-blue-400 cursor-pointer"
          onClick={() => {
            navigate("/checkout");
          }}
        >
          <ArrowLeftOutlined className="pr-2" />
          Return to Information
        </div>
        <Button
          className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
          onClick={() => {
            navigate("/checkout/payment");
          }}
        >
          Continue to Payment
        </Button>
      </div>
    </div>
  );
}
