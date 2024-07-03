import { useMutation, useQueryClient } from "@tanstack/react-query";
import { PUT } from "../../../../utils/request";
import { WarrantyStaffMenu } from "./WarrantyStaffMenu";
import Loading from "../../../../components/Loading";

const WarrantyStaffComponent = ({
  warrantyRequestId,
  staffs,
  currentStaff,
  statusText,
}: {
  warrantyRequestId: number;
  staffs: any[];
  currentStaff: string;
  statusText: any;
}) => {
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: ({
      warrantyRequestId,
      warrantyStaffId,
    }: {
      warrantyRequestId: number;
      warrantyStaffId: number;
    }) =>
      PUT(`/api/WarrantyRequests/${warrantyRequestId}`, {
        warrantyStaffId: warrantyStaffId,
      }),
    onSuccess: () =>{
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] });
      queryClient.invalidateQueries({ queryKey: ["warrantyStaffs"] });},
    onError: () =>
      queryClient.invalidateQueries({ queryKey: ["warrantyRequests"] }),
  });

  const handleStaffClick = async (warrantyStaffId: number) => {
    await mutation.mutate({ warrantyRequestId, warrantyStaffId });
  };

  return (
    <div>
      <WarrantyStaffMenu
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
export default WarrantyStaffComponent;
