import BestCustomer from "./components/BestCustomer";
import BuyerProfilePieChart from "./components/BuyerProfilePieChart";
import DashBoardStatsGrid from "./components/DashBoardStatsGrid";
import PopularAccessories from "./components/PopularAccessories";
import TransactionChart from "./components/TransactionChart";

export default function Dashboard() {
  return (
    <div className="flex gap-4 flex-col">
      <DashBoardStatsGrid />
      <div className="flex flex-row gap-4 w-full">
        <TransactionChart />
        <BuyerProfilePieChart />
      </div>
      <div className="flex flex-row gap-4 w-full">
        <BestCustomer />
        <PopularAccessories />
      </div>
    </div>
  );
}
