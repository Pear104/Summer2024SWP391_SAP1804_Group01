import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../../utils/request";
import { DeliveryStaffMenu } from "./DeliveryStaffMenu";

const DeliveryStaffComponent = ({
  warrantyRequestId ,
  currentStaff,
  staffs,
}: {
  warrantyRequestId: number;
  currentStaff: string;
  staffs: any[];
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      warrantyRequestId,
      deliveryStaffId,
    }: {
      warrantyRequestId: number;
      deliveryStaffId: number;
    }) => PUT(`/api/WarrantyRequests/${warrantyRequestId}`, { deliveryStaffId: deliveryStaffId }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
    onError: () => queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
  });

  const handleStaffClick = async (deliveryStaffId: number) => {
    await mutation.mutate({ warrantyRequestId, deliveryStaffId });
  };

  return (
    <div>
      <DeliveryStaffMenu
        staffs={staffs}
        handleStaffClick={handleStaffClick}
        staffText={currentStaff}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};
export default DeliveryStaffComponent;
