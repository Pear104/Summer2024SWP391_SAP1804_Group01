import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../utils/request";
import { DeliveryStatusMenu } from "./DeliveryStatusMenu";

const OrderUpdateComponent = ({
  orderId,
  currentStatus,
}: {
  orderId: number;
  currentStatus: string;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      orderId,
      orderStatus,
    }: {
      orderId: number;
      orderStatus: string;
    }) => PUT(`/api/Order/${orderId}`, { orderStatus: orderStatus }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["orders"] }),
    onError: () => queryClient.invalidateQueries({ queryKey: ["orders"] }),
  });

  const handleStatusClick = async (orderStatus: string) => {
    await mutation.mutate({ orderId, orderStatus });
  };

  return (
    <div>
      <DeliveryStatusMenu
        handleStatusClick={handleStatusClick}
        statusText={currentStatus}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};

export default OrderUpdateComponent;
