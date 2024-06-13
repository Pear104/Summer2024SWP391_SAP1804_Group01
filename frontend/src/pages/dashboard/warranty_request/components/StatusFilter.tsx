import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../../store/searchStore";

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
                params.set("WarrantyStatus", "Pending");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Pending
            </a>
          </Menu.Item>
          <Menu.Item key="2">
            <a
              onClick={() => {
                params.set("WarrantyStatus", "Getting");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Getting
            </a>
          </Menu.Item>
          <Menu.Item key="3">
            <a
              onClick={() => {
                params.set("WarrantyStatus", "Processing");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Processing
            </a>
          </Menu.Item>
          <Menu.Item key="4">
            <a
              onClick={() => {
                params.set("WarrantyStatus", "Returning");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Returning
            </a>
          </Menu.Item>
          <Menu.Item key="5">
            <a
              onClick={() => {
                params.set("WarrantyStatus", "Failed");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Failed
            </a>
          </Menu.Item>
          <Menu.Item key="6">
            <a
              onClick={() => {
                params.set("WarrantyStatus", "Completed");
                setQueryUrl(`/api/WarrantyRequests?` + params.toString());
                navigate("/admin/warranty-request?" + params.toString());
              }}
            >
              Completed
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
