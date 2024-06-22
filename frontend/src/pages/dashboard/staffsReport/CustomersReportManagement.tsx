import BestAccountsBasedOnOrder from "./Components/RankAccountBasedOnTotalOrder";

function PotentialCustomerReportManagement() {
    return (
        <div>
            <div>
                <BestAccountsBasedOnOrder reportApiEndPoint="/api/Report/PotentialCustomerReport" tableHeaderColumns={["Rank", "ID", "Customer name", "Total order"]} />
            </div>
        </div>
    );
}
export default PotentialCustomerReportManagement;