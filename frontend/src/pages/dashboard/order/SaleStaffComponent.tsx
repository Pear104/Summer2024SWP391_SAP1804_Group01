import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../utils/request";
import { SaleStaffMenu } from "./SaleStaffMenu";
import Loading from "../../../components/Loading";

const SaleStaffComponent = ({
  orderId,
  staffs,
  currentStaff,
  statusText,
}: {
  orderId: number;
  staffs: any[];
  currentStaff: string;
  statusText: any;
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
        statusText={statusText}
      />
      {mutation.isPending && <Loading />}
      {mutation.error && <p>Error: {(mutation.error as Error).message}</p>}
    </div>
  );
};
export default SaleStaffComponent;
