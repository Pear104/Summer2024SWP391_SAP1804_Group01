import React, { useState } from "react";
import { Button, Modal, Input, message } from "antd";
import { POST } from "../../../../utils/request";

const App: React.FC = () => {
  const [open, setOpen] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);
  // const [modalText, setModalText] = useState('Content of the modal');
  const [percent, setPercent] = useState(0);

  const showModal = () => {
    setOpen(true);
  };

  const handleOk = async () => {
    if (percent === undefined) {
      message.error("Please enter a valid percent.");
      return;
    }

    if (percent <= 0 || percent >= 5) {
      message.error("Percent must be greater than 0 and less than 5.");
      return;
    }
    Modal.confirm({
      title: "Are you sure you want to create this price rate?",
      onOk: async () => {
        setConfirmLoading(true);
        try {
          const response = await POST("/api/PriceRate?", {
            percent: percent,
          });
          console.log("API response:", response);
          window.location.reload();
          setOpen(false);
        } catch (error) {
          console.error("API error:", error);
          message.error("Failed to create price rate.");
        } finally {
          setConfirmLoading(false);
        }
      },
      onCancel: () => {
        console.log("Action canceled");
      },
    });
  };

  const handleCancel = () => {
    setOpen(false);
  };

  return (
    <>
      <Button
        className="px-4 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
        type="primary"
        onClick={showModal}
      >
        Create Price Rate
      </Button>
      <Modal
        title="Create Price Rate"
        open={open}
        onOk={handleOk}
        confirmLoading={confirmLoading}
        onCancel={handleCancel}
      >
        <p>Enter new price rate: </p>
        <Input
          type="number"
          value={percent}
          onChange={(e) => setPercent(Number(e.target.value))}
          placeholder="Enter percent"
          step="0.01"
        />
      </Modal>
    </>
  );
};

export default App;
