import DashBoardStatsGrid from "./components/DashBoardStatsGrid";
import TransactionChart from "./components/TransactionChart";

export default function Dashboard() {
  return (
    <div className="flex gap-4 flex-col">
      <DashBoardStatsGrid />
      <TransactionChart />
    </div>
  );
}
