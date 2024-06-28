import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { getCookie } from "../../../../utils/cookie";
import { jwtDecode } from "jwt-decode";

export const WarrantyStaffMenu = ({
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
      disabled={
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "WarrantyStaff" ||
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "DeliveryStaff"
      }
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
