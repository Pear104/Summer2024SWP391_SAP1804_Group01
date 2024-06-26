
interface listTableHeaderItems {
    items: string[]
}
function ReportTableHeader({ items = [] }: listTableHeaderItems) {

    const headerItems = items.map(i => (
        <th className="px-6 py-3 border-b text-left text-sm font-semibold text-gray-700">
            {i}
        </th>
    ));
    return (
        <thead>
            <tr className="w-full bg-gray-100">
                {headerItems}
            </tr>
        </thead>
    );
}
export default ReportTableHeader