import React, { StrictMode, useState, useEffect } from "react";
import { useLocation, useNavigate, Link } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";


function CustomerManage() {
  const location = useLocation();
  const [statusText, setStatusText] = useState("Status");
  const [productTypeText, setProductTypeText] = useState("Product Type");
  // sort item
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  const columnHeaders = [
    "Name",
    "Account Id",
    "Date of birth",
    "Email",
    "Phone number",
    "Address",
    "Gender",
    "Reward point",
  ];


  const navigate = useNavigate();

  //getting predefined variable from useSearchStore
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);

  //this useEffect will only run once. During mounting
  useEffect(() => {
    // params.delete("IsAvailability");
    // params.delete("IsDescending");
    // params.delete("SortBy");
    setQueryUrl("/api/Accounts/Customer?");
  }, []);
  console.log("query url: " + queryUrl);

  //query data by calling api end-point
  const [customer] = useQueries({
    queries: [
      {
        queryKey: ["customer", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      }
    ]
  });

  //check if {query return any data}? {get customers json from body} : {[]}
  const diamondsData = customer?.data?.content || [];
  console.log(diamondsData);
  // const renderDiamondRow = (diamond: any) => (
  //   <DiamondRow
  //     key={diamond.diamondId}
  //     diamond={diamond}
  //     selectedDiamonds={selectedDiamonds}
  //     setSelectedDiamonds={setSelectedDiamonds}
  //     price={getDiamondPrice(
  //       diamond,
  //       diamondPrice?.data,
  //       priceRate?.data?.percent
  //     ).toLocaleString("en-US", {
  //       style: "currency",
  //       currency: "USD",
  //       maximumFractionDigits: 0,
  //     })}
  //   /> 
  // );

  return (
    <StrictMode>
      <div>CustomerManage</div>



    </StrictMode>
  );
}

export default CustomerManage;