import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../utils/request";
import { DeliveryStaffMenu } from "./DeliveryStaffMenu";

const DeliveryStaffComponent = ({
  orderId,
  currentStaff,
  staffs,
  statusText,
}: {
  orderId: number;
  currentStaff: string;
  staffs: any[];
  statusText: any;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      orderId,
      deliveryStaffId,
    }: {
      orderId: number;
      deliveryStaffId: number;
    }) => PUT(`/api/Order/${orderId}`, { deliveryStaffId: deliveryStaffId }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["orders"] }),
    onError: () => queryClient.invalidateQueries({ queryKey: ["orders"] }),
  });

  const handleStaffClick = async (deliveryStaffId: number) => {
    await mutation.mutate({ orderId, deliveryStaffId });
  };

  return (
    <div>
      <DeliveryStaffMenu
        staffs={staffs}
        handleStaffClick={handleStaffClick}
        staffText={currentStaff}
        statusText={statusText}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};
export default DeliveryStaffComponent;
