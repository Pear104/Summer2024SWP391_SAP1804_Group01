import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const SaleStaffMenu = ({
  handleStaffClick,
  staffText,
  staffs,
}: {
  handleStaffClick: any;
  staffText: any;
  staffs: any[];
}) => {
  return (
    <Dropdown
      overlay={
        <Menu className="w-40" defaultValue={staffText}>
          {staffs.map((staff: any) => (
            <Menu.Item key={staff.accountId}>
              <a onClick={() => handleStaffClick(staff.accountId)}>
                {staff.name}
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
