import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../../utils/request";
import { SaleStaffMenu } from "./SaleStaffMenu";

const SaleStaffComponent = ({
  warrantyRequestId,
  staffs,
  currentStaff,
}: {
  warrantyRequestId: number;
  staffs: any[];
  currentStaff: string;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      warrantyRequestId,
      saleStaffId,
    }: {
      warrantyRequestId: number;
      saleStaffId: number;
    }) => PUT(`/api/WarrantyRequests/${warrantyRequestId}`, { saleStaffId: saleStaffId }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["warranty"] }),
    onError: () => queryClient.invalidateQueries({ queryKey: ["warranty"] }),
  });

  const handleStaffClick = async (saleStaffId: number) => {
    await mutation.mutate({warrantyRequestId, saleStaffId });
  };

  return (
    <div>
      <SaleStaffMenu
        handleStaffClick={handleStaffClick}
        staffText={currentStaff}
        staffs={staffs}
      />
      {mutation.isPending && <p>Updating...</p>}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};
export default SaleStaffComponent;
