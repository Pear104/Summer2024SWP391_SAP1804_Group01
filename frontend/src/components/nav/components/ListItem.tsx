import React from "react";

const ListItem = ({ children }: { children: React.ReactNode }) => {
  return (
    <li>
      <span className="relative -left-[6px]">{children}</span>
    </li>
  );
};

export default ListItem;
