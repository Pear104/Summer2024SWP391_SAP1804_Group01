import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";

export const StatusFilter = ({ statusText }: { statusText: any }) => {
  const navigate = useNavigate();
  const params = new URLSearchParams(window.location.search);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  return (
    <Dropdown
      overlay={
        <Menu>
          <Menu.Item key="1">
            <a
              onClick={() => {
                params.set("OrderStatus", "Pending");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/orders?" + params.toString());
              }}
            >
              Pending
            </a>
          </Menu.Item>
          <Menu.Item key="2">
            <a
              onClick={() => {
                params.set("OrderStatus", "Processing");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/orders?" + params.toString());
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
                navigate("/admin/orders?" + params.toString());
              }}
            >
              Confirmed
            </a>
          </Menu.Item>
          <Menu.Item key="4">
            <a
              onClick={() => {
                params.set("OrderStatus", "Delivering");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/orders?" + params.toString());
              }}
            >
              Delivering
            </a>
          </Menu.Item>
          <Menu.Item key="5">
            <a
              onClick={() => {
                params.set("OrderStatus", "Completed");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/orders?" + params.toString());
              }}
            >
              Completed
            </a>
          </Menu.Item>
          <Menu.Item key="6">
            <a
              onClick={() => {
                params.set("OrderStatus", "Failed");
                setQueryUrl(`/api/Order?` + params.toString());
                navigate("/admin/orders?" + params.toString());
              }}
            >
              Failed
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
