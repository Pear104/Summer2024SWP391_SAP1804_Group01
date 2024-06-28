import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../../utils/request";
import { DeliveryStaffMenu } from "./DeliveryStaffMenu";
import Loading from "../../../../components/Loading";

const DeliveryStaffComponent = ({
  warrantyRequestId,
  currentStaff,
  staffs,
  statusText,
}: {
  warrantyRequestId: number;
  currentStaff: string;
  staffs: any[];
  statusText: any;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      warrantyRequestId,
      deliveryStaffId,
    }: {
      warrantyRequestId: number;
      deliveryStaffId: number;
    }) =>
      PUT(`/api/WarrantyRequests/${warrantyRequestId}`, {
        deliveryStaffId: deliveryStaffId,
      }),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
    onError: () =>
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
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
        statusText={statusText}
      />
      {mutation.isPending && <Loading />}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};
export default DeliveryStaffComponent;
