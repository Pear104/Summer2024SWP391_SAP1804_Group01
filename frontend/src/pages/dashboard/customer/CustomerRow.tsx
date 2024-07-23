import React from "react";

//set up interface
//set up default value
function calculateRank(reward_point: number): string {
  if (reward_point < 500) {
    return "Bronze";
  } else if (reward_point < 1000) {
    return "Silver";
  } else if (reward_point < 1500) {
    return "Gold";
  } else if (reward_point < 2000) {
    return "Platinum";
  } else if (reward_point < 2500) {
    return "Emerald";
  } else {
    return "Diamond";
  }
}

function CustomerRow({
  account,
  selectedAccount,
  setSelectedAccount,
}: {
  account: any;
  selectedAccount: number[];
  setSelectedAccount: React.Dispatch<React.SetStateAction<number[]>>;
}) {
  if (!account) {
    return (
      <>
        <tr>
          <td>
            <div className="text-center items-center">
              <p>There is no customer</p>
            </div>
          </td>
        </tr>
      </>
    );
  }
  return (
    <>
      <tr key={account.accountId}>
        {/* end select checkbox */}
        {/* map diamond */}
        <td className="px-6 py-4 whitespace-nowrap">
          {/*start account id*/}
          <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            {account.accountId}
          </td>
        </td>{" "}
        {/*end account id*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account nam*/}
          {account.name}
        </td>{" "}
        {/*end account name*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account birthday*/}
          {account.birthday}
        </td>{" "}
        {/*end account birthday*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account gender*/}
          {account.gender}
        </td>{" "}
        {/*end account gender*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account emai*/}
          {account.email}
        </td>{" "}
        {/*end account email*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account phone number*/}
          {account.phoneNumber}
        </td>{" "}
        {/*end account phone number*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account address*/}
          {account.address}
        </td>{" "}
        {/*end account address*/}
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {" "}
          {/*start account total order*/}
          {account.totalOrders}
        </td>{" "}
        {/*end account total order*/}
        <td className="px-6 py-4 whitespace-nowrap text-left text-sm font-medium">
          {" "}
          {/*start account reward point*/}
          <div className="text-indigo-600 hover:text-indigo-900">
            {account.rewardPoint}
          </div>
        </td>{" "}
        {/*end account reward point*/}
        <td className="px-6 py-4 whitespace-nowrap text-left text-sm font-medium">
          {" "}
          {/*start account rank*/}
          <div className="text-indigo-600 hover:text-indigo-900">
            {calculateRank(account.rewardPoint)}
          </div>
        </td>{" "}
        {/*end account rank*/}
      </tr>
    </>
  );
}
export default CustomerRow;
