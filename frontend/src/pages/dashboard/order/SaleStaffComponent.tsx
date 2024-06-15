import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../utils/request";
import { SaleStaffMenu } from "./SaleStaffMenu";

const SaleStaffComponent = ({
  orderId,
  staffs,
  currentStaff,
}: {
  orderId: number;
  staffs: any[];
  currentStaff: string;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      orderId,
      saleStaffId,
    }: {
      orderId: number;
      saleStaffId: number;
    }) => PUT(`/api/Order/${orderId}`, { saleStaffId: saleStaffId }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["orders"] });
      queryClient.invalidateQueries({ queryKey: ["saleStaffs"] });
    },
    onError: () => queryClient.invalidateQueries({ queryKey: ["orders"] }),
  });

  const handleStaffClick = async (saleStaffId: number) => {
    await mutation.mutate({ orderId, saleStaffId });
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
