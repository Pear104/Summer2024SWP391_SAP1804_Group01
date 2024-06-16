import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const DeliveryStaffMenu = ({
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
      disabled={statusText == "Confirmed" ? false : true}
      overlay={
        <Menu defaultValue={staffText}>
          {staffs?.length > 0 &&
            staffs?.map((staff: any) => (
              <Menu.Item
                key={staff?.accountId}
                disabled={
                  staff?.ordersOfDeliveryStaff?.filter(
                    (order: any) =>
                      order?.orderStatus == "Confirmed" ||
                      order?.orderStatus == "Delivering"
                  ).length >= 5
                    ? true
                    : false
                }
              >
                <a onClick={() => handleStaffClick(staff.accountId)}>
                  {staff?.name}:{" "}
                  {
                    staff?.ordersOfDeliveryStaff?.filter(
                      (order: any) =>
                        order?.orderStatus == "Confirmed" ||
                        order?.orderStatus == "Delivering"
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
