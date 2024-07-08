import BestAccountsBasedOnOrder from "./Components/RankAccountBasedOnTotalOrder";

function DeliveryReportManagement() {
  return (
    <div>
      <div>
        <BestAccountsBasedOnOrder
          role="Delivery Staff"
          reportApiEndPoint="/api/Report/DeliveryReport"
          tableHeaderColumns={["Rank", "ID", "Deliverier name", "Total order"]}
        />
      </div>
    </div>
  );
}
export default DeliveryReportManagement;
