import { Button, Modal } from "antd";
import { useState } from "react";

export const SaleStatusMenu = ({
  handleStatusClick,
  statusText,
}: {
  handleStatusClick: any;
  statusText: any;
}) => {
  const [_open, setOpen] = useState(false);

  const handleOk = () => {
    setOpen(false);
    handleStatusClick("Confirmed");
  };

  const handleCancel = () => {
    setOpen(false);
  };
  return (
    <>
      <Button
        disabled={statusText == "Confirmed" ? true : false}
        className="border p-2 rounded-md flex items-center"
        onClick={() => {
          Modal.confirm({
            title: "Alert",
            content: "Confirming your action ?",
            onOk: handleOk,
            onCancel: handleCancel,
            footer: (_, { OkBtn, CancelBtn }) => (
              <>
                <CancelBtn />
                <OkBtn />
              </>
            ),
          });
        }}
      >
        {statusText}
      </Button>
    </>
    // <Button
    //   className="border p-2 rounded-md flex items-center"
    //   onClick={() => {
    //     handleStatusClick("Confirmed");
    //   }}
    // >
    //   <span>{statusText}</span>
    // </Button>
  );
};
