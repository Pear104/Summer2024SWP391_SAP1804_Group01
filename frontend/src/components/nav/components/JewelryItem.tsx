import ListItem from "./ListItem";

const JewelryItem = () => {
  return (
    <div className="grid grid-cols-12 gap-x-4">
      <div className="col-span-12 playfair-display-regular font-bold text-2xl mb-3">
        Ring
      </div>
      <div className="col-span-4">
        <span className="font-bold border-b-2 border-blue-600 mb-10 pb-1">
          Style
        </span>
        <div className="text-base my-3">
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
        </div>
      </div>
      <div className="col-span-4">
        <span className="font-bold border-b-2 border-blue-600 pb-1">Shape</span>
        <div className="text-base my-2">
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
        </div>
      </div>
      <div className="col-span-4">
        <span className="font-bold border-b-2 border-blue-600 pb-1">Metal</span>
        <div className="text-base my-2">
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
          <ListItem>The halo</ListItem>
        </div>
      </div>
    </div>
  );
};

export default JewelryItem;
