import { useState } from "react";
import { EditOutlined } from "@ant-design/icons";
import { Button, Card, Input, Modal, message } from "antd";
import { POST } from "../../../../utils/request";

const { Meta } = Card;

function formatDateTime(dateString: string): string {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng bắt đầu từ 0
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
}

const MaterialPriceItem = ({ materialItem }: { materialItem: any }) => {
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [newPrice, setNewPrice] = useState("");
  const [loading, setLoading] = useState(false);
  const [_confirmLoading, setConfirmLoading] = useState(false);

  const showModal = () => {
    setIsModalVisible(true);
  };
  const handleOk = async () => {
    if (!newPrice) {
      message.error("Please enter a new material price.");
      return;
    }
    if (parseFloat(newPrice) < 0 || parseFloat(newPrice) > 1000000000) {
      message.error(
        "Please enter a valid material price between 0 and 1,000,000,000."
      );
      return;
    }
    setLoading(true);
    Modal.confirm({
      title:
        "Are you sure you want to update this price for this kind of material?",
      onOk: async () => {
        setConfirmLoading(true);
        try {
          await POST("/api/MaterialPrices", {
            karat: materialItem.karat,
            effTime: new Date().toISOString(),
            unitPrice: parseFloat(newPrice),
          });
          window.location.reload();
          message.success("Price updated successfully!");
          setIsModalVisible(false);
        } catch (error) {
          message.error("Failed to update the price.");
        } finally {
          setLoading(false);
        }
      },
      onCancel: () => {
        console.log("Action canceled");
        setIsModalVisible(false);
      },
    });
  };
  const handleCancel = () => {
    setIsModalVisible(false);
  };
  //   const content = (
  //     <div>
  //       <Button type="primary" onClick={handleOk} loading={loading}>
  //         Confirm
  //       </Button>
  //     </div>
  //   );
  let description = "";
  const dateString = materialItem.effTime;
  const formattedDate = formatDateTime(dateString);
  if (materialItem.karat === 18) {
    description =
      "18k gold is an alloy consisting of 75% pure gold and 25% other metals. It offers a balance of durability and a rich gold color, making it ideal for jewelry. The added metals increase its strength and resistance to wear and tear, making it more suitable for everyday use.";
  } else if (materialItem.karat === 24) {
    description =
      "24k gold is 100% pure gold, known for its rich yellow hue and exceptional softness. This makes it highly desirable, but it is less suitable for jewelry due to its malleability and susceptibility to scratches and bending.";
  } else {
    description = "Description not available";
  }
  return (
    <>
      <Card
        className="flex flex-col justify-between w-full h-full"
        cover={
          <img
            alt={`Image about ${materialItem.karat} karat gold`}
            src={`/images/${materialItem.karat}.jpg`}
          ></img>
        }
        actions={[<EditOutlined key="edit" onClick={showModal} />]}
      >
        <Meta
          title={
            <>
              <div className="text-xl font-bold text-wrap">
                Gold price for ${materialItem.karat}K accessory material
              </div>
            </>
          }
          description={
            <>
              <div className="text-1/2xl">{description}</div>
              <div className="text-bold text-red-500 text-2xl">
                Unit Price: {materialItem.unitPrice}
              </div>
              <div>
                <b>Effective Time:</b> {formattedDate}
              </div>
            </>
          }
        />
      </Card>
      <Modal
        title="Update Material Price"
        visible={isModalVisible}
        onCancel={handleCancel}
        footer={[
          <Button key="cancel" onClick={handleCancel}>
            Cancel
          </Button>,
          <Button
            key="confirm"
            type="primary"
            onClick={handleOk}
            loading={loading}
          >
            Confirm
          </Button>,
        ]}
      >
        <Input
          placeholder="Enter new price"
          value={newPrice}
          onChange={(e) => setNewPrice(e.target.value)}
          type="number"
        />
      </Modal>
    </>
  );
};
export default MaterialPriceItem;
