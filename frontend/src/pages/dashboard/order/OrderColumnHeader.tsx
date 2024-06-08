import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function DiamondColumnHeader({
  header,
  params,
  setQueryUrl,
  type,
}: {
  header: any;
  params: URLSearchParams;
  setQueryUrl: any;
  type: string;
}) {
  const navigate = useNavigate();
  const [sortConfig, setSortConfig] = useState<{
    field: string;
    direction: "asc" | "desc" | "none";
    isNumber: boolean;
  }>({ field: "", direction: "none", isNumber: false });
  const sortableColumns = [
    "price",
    "shape",
    "carat",
    "color",
    "clarity",
    "cut",
  ];
  const handleSort = async (field: string) => {
    let direction: "asc" | "desc" | "none" = "asc";
    let isNumber = false;
    if (sortConfig.field === field && sortConfig.direction === "asc") {
      direction = "desc";
    } else if (sortConfig.field === field && sortConfig.direction === "desc") {
      direction = "none";
    }

    if (field === "price") {
      isNumber = true;
    }

    setSortConfig({ field, direction, isNumber });
    params.set("IsDescending", (direction === "desc").toString());
    params.set("SortBy", field);
    navigate(`/admin/${type}s?` + params.toString());
    setQueryUrl(`/api/${type}s?` + params.toString());
  };
  return (
    <>
      <th
        key={header}
        scope="col"
        className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider "
      >
        <div className="flex flex-row items-center gap-[5px]">
          <span>{header}</span>
          {sortableColumns.includes(header.toLowerCase()) && (
            <div className="sort">
              <button
                type="button"
                onClick={() => handleSort(header.toLowerCase())}
              >
                <svg
                  width="12"
                  height="12"
                  viewBox="0 0 17 23"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M1 8.5L8.5 1L16 8.5"
                    stroke={
                      sortConfig.field === header.toLowerCase() &&
                      sortConfig.direction === "asc"
                        ? "black"
                        : "#e1e3e5"
                    }
                    strokeWidth="1.5"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  />
                  <path
                    d="M16 14L8.5 21.5L1 14"
                    stroke={
                      sortConfig.field === header.toLowerCase() &&
                      sortConfig.direction === "desc"
                        ? "black"
                        : "#e1e3e5"
                    }
                    strokeWidth="1.5"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  />
                </svg>
              </button>
            </div>
          )}
        </div>
      </th>
    </>
  );
}
