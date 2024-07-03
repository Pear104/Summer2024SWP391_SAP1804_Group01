import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { jwtDecode } from "jwt-decode";
import { getCookie } from "../../../../utils/cookie";

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
      disabled={
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "WarrantyStaff" ||
        (jwtDecode(getCookie("accessToken") || "") as any)?.role ==
          "DeliveryStaff" ||
        statusText != "Pending"
      }
      overlay={
        <Menu defaultValue={staffText}>
          {staffs?.length > 0 &&
            staffs?.map((staff: any) => (
              <Menu.Item
                key={staff?.name}
                disabled={
                  staff?.warrantyRequestsOfDeliveryStaff?.filter(
                    (warranty: any) =>
                      warranty?.warrantyStatus == "Pending" ||
                      warranty?.warrantyStatus == "Processing" ||
                      warranty?.warrantyStatus == "Returning" ||
                      warranty?.warrantyStatus == "Getting"
                  ).length >= 5
                    ? true
                    : false
                }
              >
                <a onClick={() => handleStaffClick(staff.accountId)}>
                  {staff?.name}:{" "}
                  {
                    staff?.warrantyRequestsOfDeliveryStaff?.filter(
                      (warranty: any) =>
                        warranty?.warrantyStatus == "Pending" ||
                        warranty?.warrantyStatus == "Processing" ||
                        warranty?.warrantyStatus == "Returning" ||
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
