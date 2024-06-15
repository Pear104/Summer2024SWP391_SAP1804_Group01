import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const SaleStaffMenu = ({
  handleStaffClick,
  staffText,
  staffs,
  statusText,
}: {
  handleStaffClick: any;
  staffText: any;
  staffs: any[];
  statusText: any;
}) => {
  return (
    <Dropdown
      disabled={statusText == "Processing" ? false : true}
      overlay={
        <Menu className="w-44" defaultValue={staffText}>
          {staffs?.length > 0 &&
            staffs?.map((staff: any) => (
              <Menu.Item
                key={staff?.accountId}
                disabled={
                  staff?.ordersOfSaleStaff?.filter(
                    (order: any) => order?.orderStatus == "Processing"
                  ).length >= 5
                    ? true
                    : false
                }
              >
                <a onClick={() => handleStaffClick(staff?.accountId)}>
                  {staff?.name}:{" "}
                  {
                    staff?.ordersOfSaleStaff?.filter(
                      (order: any) => order?.orderStatus == "Processing"
                    ).length
                  }
                </a>
              </Menu.Item>
            ))}
        </Menu>
      }
      placement="bottom"
      trigger={["click"]}
    >
      <Button className="border p-2 rounded-md flex items-center">
        <span>{staffText}</span>
        <DownOutlined className="ml-1" />
      </Button>
    </Dropdown>
  );
};
