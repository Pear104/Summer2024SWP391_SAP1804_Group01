import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { getCookie } from "../../../../utils/cookie";
import { jwtDecode } from "jwt-decode";

export const WarrantyStaffMenu = ({
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
      disabled={
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "WarrantyStaff" ||
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "DeliveryStaff" ||
        statusText != "Getting"
      }
      overlay={
        <Menu className="w-40" defaultValue={staffText}>
          {staffs.map((staff: any) => (
            <Menu.Item 
            key={staff.accountId}
            disabled={
              staff?.warrantyRequestsOfWarrantyStaff?.filter(
                (warranty: any) => warranty?.warrantyStatus == "Processing" ||
                warranty?.warrantyStatus == "Getting"
              ).length >= 5
                ? true
                : false
            }
            >
              <a onClick={() => handleStaffClick(staff.accountId)}>
                {staff.name}:{" "}
                {
                    staff?.warrantyRequestsOfWarrantyStaff?.filter(
                      (warranty: any) => warranty?.warrantyStatus == "Processing"||
                      warranty?.warrantyStatus == "Getting"
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
