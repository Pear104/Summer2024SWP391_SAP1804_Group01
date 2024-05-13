import ListItem from "./ListItem";

const DiamondItem = () => {
  return (
    <div className="col-span-2 px-8">
      <div className="playfair-display-regular font-bold text-2xl mb-3">
        Diamond
      </div>
      <div className="grid grid-cols-5 w-[700px]">
        <div className="col-span-2">
          <span className="font-bold border-b-2 border-blue-600 pb-1">
            Shape
          </span>
          <div className="grid grid-cols-2 mt-4">
            <div className="col-span-1 text-base">
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
            </div>
            <div className="col-span-1 text-base">
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
              <ListItem>The halo</ListItem>
            </div>
          </div>
        </div>
        <div className="col-span-1 border-r pr-4">
          <span className="font-bold border-b-2 border-blue-600 pb-1">
            Carat
          </span>
          <div className="col-span-1 text-base mt-4">
            <ListItem>The halo</ListItem>
            <ListItem>The halo</ListItem>
            <ListItem>The halo</ListItem>
            <ListItem>The halo</ListItem>
            <ListItem>The halo</ListItem>
          </div>
        </div>
        <div className="col-span-2 pl-4">
          <span className="font-bold border-b-2 border-blue-600 pb-1">
            Create your own
          </span>
          <div className="col-span-1 text-base mt-4">
            <ListItem>Start with a diamond</ListItem>
            <ListItem>Start with a setting</ListItem>
            <ListItem>The halo</ListItem>
          </div>
        </div>
      </div>
      <div className="font-bold my-4">View all</div>
    </div>
  );
};

export default DiamondItem;
