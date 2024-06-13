import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../../utils/request";
import { StatusMenu } from "./StatusMenu";


const WarrantyUpdateComponent = ({
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
    }) => PUT(`/api/WarrantyRequests/${warrantyRequestId}`, { warrantyStatus: warrantyRequestStatus }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
    onError: () => queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
  });

  const handleStatusClick = async (warrantyRequestStatus: string) => {
    await mutation.mutate({warrantyRequestId, warrantyRequestStatus });
  };

  return (
    <div>
      <StatusMenu
        handleStatusClick={handleStatusClick}
        statusText={currentStatus}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};

export default WarrantyUpdateComponent;
