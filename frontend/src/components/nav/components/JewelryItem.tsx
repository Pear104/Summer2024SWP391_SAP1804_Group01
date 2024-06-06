import ListItem from "./ListItem";

const JewelryItem = ({
  accessoryType,
  shapes,
}: {
  shapes: any;
  accessoryType: any;
}) => {
  return (
    <div className="">
      <div className="col-span-12 playfair-display-regular font-bold text-2xl mb-3">
        {accessoryType}
      </div>
      <div className="">
        <span className="font-bold border-b-2 border-blue-600 mb-10 pb-1">
          Shape
        </span>
        <div className="grid grid-cols-2 gap-x-4 mt-2">
          {shapes.map((shape: any) => (
            <ListItem>{shape.name}</ListItem>
          ))}
        </div>
      </div>
      {/* <div className="col-span-4">
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
      </div> */}
    </div>
  );
};

export default JewelryItem;
