import React from "react";
import DashBoardStatsGrid from "./DashBoardStatsGrid";
import TransactionChart from "./TransactionChart";

export default function Dashboard() {
  return (
    <div className="flex gap-4 flex-col">
      <DashBoardStatsGrid />
      <TransactionChart />
    </div>
  );
}
