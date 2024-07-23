import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";

export const SaleStatusFilter = ({ statusText }: { statusText: any }) => {
  const navigate = useNavigate();
  const params = new URLSearchParams(window.location.search);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  return (
    <Dropdown
      overlay={
        <Menu>
          <Menu.Item key="2">
            <a
              onClick={() => {
                params.set("OrderStatus", "Processing");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/sale-staffs?" + params.toString());
              }}
            >
              Processing
            </a>
          </Menu.Item>
          <Menu.Item key="3">
            <a
              onClick={() => {
                params.set("OrderStatus", "Confirmed");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/sale-staffs?" + params.toString());
              }}
            >
              Confirmed
            </a>
          </Menu.Item>
        </Menu>
      }
      placement="bottom"
      trigger={["click"]}
    >
      <Button className="border p-2 rounded-md flex items-center">
        <span>{statusText}</span>
        <DownOutlined className="ml-1" />
      </Button>
    </Dropdown>
  );
};
