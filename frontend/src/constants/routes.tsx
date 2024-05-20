import Error from "../pages/Error";
import Home from "../pages/home/Home";
import MainLayout from "../layouts/MainLayout";
import Login from "../pages/authentication/Login";
import Register from "../pages/authentication/Register";
import ConfirmEmail from "../pages/authentication/ConfirmEmail";
import AccountLayout from "../layouts/AccountLayout";
import AccountDetail from "../pages/account/AccountDetail";
import OrderHistory from "../pages/account/OrderHistory";
import ProductLayout from "../layouts/ProductLayout";
import DiamondList from "../pages/product/diamond/DiamondList";

const routes = [
  {
    errorElement: <Error />,
    path: "/",
    element: <MainLayout />,
    children: [
      {
        children: [
          {
            element: <Home />,
            path: "/",
          },
          {
            element: <Login />,
            path: "authentication/login",
          },
          {
            element: <Register />,
            path: "authentication/register",
          },
          {
            element: <ConfirmEmail />,
            path: "authentication/confirm-email",
          },
          {
            element: <AccountLayout />,
            path: "account",
            children: [
              {
                index: true,
                element: <AccountDetail />,
              },
              {
                element: <OrderHistory />,
                path: "order-history",
              },
            ],
          },
          {
            element: <ProductLayout />,
            path: "product",
            children: [
              {
                path: "diamond",
                element: <DiamondList />,
              },
              {
                element: <OrderHistory />,
                path: "order-history",
              },
            ],
          },
        ],
      },
    ],
  },
];

export default routes;
