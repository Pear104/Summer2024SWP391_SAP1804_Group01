import Logo from "../../../components/logo/Logo";

export default function InvoiceItem() {
  return (
    <div className="border border-black px-4 py-2 w-full">
      <div className="flex justify-between">
        <Logo />
        <div className="font-semibold text-2xl tracking-wider">
          Diamond Invoice
        </div>
      </div>
      <div className="mt-4 bg-slate-200 py-3 px-4 gap-y-2 flex flex-col">
        <div className="grid grid-cols-3 text-xl">
          <div>Client Name:</div>
          <div>Ahihi</div>
        </div>
        <div className="grid grid-cols-3 text-xl">
          <div>Client Name:</div>
          <div>Ahihi</div>
        </div>
        <div className="grid grid-cols-3 text-xl">
          <div>Client Name:</div>
          <div>Ahihi</div>
        </div>
      </div>
      <div>
        <table className="w-full">
          <thead>
            <tr>
              <td>Ahihi</td>
              <td>Ahihi</td>
              <td>Ahihi</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div></div>
      <div></div>
      <div></div>
    </div>
  );
}
