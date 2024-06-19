import { useMutation, useQueryClient } from "@tanstack/react-query";
import { DeliveryWarrantyStatusMenu } from "./DeliveryWarrantyStatusMenu";
import { PUT } from "../../../utils/request";

const DeliveryWarrantyUpdateComponent = ({
  warrantyRequestId,
  currentStatus,
}: {
  warrantyRequestId: number;
  currentStatus: string;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      warrantyRequestId,
      warrantyRequestStatus,
    }: {
      warrantyRequestId: number;
      warrantyRequestStatus: string;
    }) =>
      PUT(`/api/WarrantyRequests/${warrantyRequestId}`, {
        warrantyStatus: warrantyRequestStatus,
      }),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
    onError: () =>
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
  });

  const handleStatusClick = async (warrantyRequestStatus: string) => {
    await mutation.mutate({ warrantyRequestId, warrantyRequestStatus });
  };

  return (
    <div>
      <DeliveryWarrantyStatusMenu
        handleStatusClick={handleStatusClick}
        statusText={currentStatus}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};

export default DeliveryWarrantyUpdateComponent;
