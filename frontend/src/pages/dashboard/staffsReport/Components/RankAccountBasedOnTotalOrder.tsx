import { useEffect, useState } from "react";
import { GET } from "../../../../utils/request";
import ReportTableHeader from "./ReportTableHeader";

interface AccountInfo {
    accountID: string,
    accountName: string,
    totalOrder: number
}

interface props {
    reportApiEndPoint: string,
    tableHeaderColumns: string[]
}

function BestAccountsBasedOnOrder({ reportApiEndPoint = "", tableHeaderColumns = [] }: props) {
    // const [data, setData] = useState<
    //     {
    //         staffID: string;
    //         staffName: string;
    //         totalOrder: number;
    //     }[]
    // >([]);

    const [accountsList, setAccountsList] = useState<AccountInfo[]>([]);

    const fetchData = async () => {
        const fetchedData = await GET(reportApiEndPoint);
        const fetchedDataToAccountData: AccountInfo[] = fetchedData.map((account: any) => ({
            accountID: account?.accountId,
            accountName: account?.name,
            totalOrder: account?.totalOrders,
        }));
        setAccountsList(fetchedDataToAccountData);
    };

    useEffect(() => {
        fetchData();
    }, []);

    const sortData: AccountInfo[] = accountsList.sort((a, b) => b.totalOrder - a.totalOrder);

    return (
        <div className="bg-white p-6 rounded-lg border border-gray-200 shadow-lg">
            <div className="mb-4">
                <h1 className="text-2xl font-bold text-gray-800">Best Sales Staff</h1>
                <p className="text-gray-600">
                    List of top-performing sales staff based on total orders.
                </p>
            </div>
            <div className="overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200 rounded-lg">
                    <ReportTableHeader items={tableHeaderColumns} />
                    <tbody>
                        {sortData.map((accountEntry, index) => (
                            <tr
                                key={accountEntry.accountID}
                                className={`${index % 2 === 0 ? "bg-gray-50" : "bg-white"}`}
                            >
                                <td className="px-6 py-4 border-b text-gray-900 text-2xl">
                                    {index == 0 && "🥇"}
                                    {index == 1 && "🥈"}
                                    {index == 2 && "🥉"}
                                    {index > 2 && <div className="ml-3">{index + 1}</div>}
                                </td>
                                <td className="px-6 py-4 border-b text-sm text-gray-900">
                                    {accountEntry.accountID}
                                </td>
                                <td className="px-6 py-4 border-b text-sm text-gray-900">
                                    {accountEntry.accountName}
                                </td>
                                <td className="px-6 py-4 border-b text-sm text-gray-900">
                                    {accountEntry.totalOrder}
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default BestAccountsBasedOnOrder;