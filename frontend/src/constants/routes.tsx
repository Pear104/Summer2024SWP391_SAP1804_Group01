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
import Test from "../pages/test/Test";
import DiamondDetail from "../pages/product/diamond/DiamondDetail";
import AccessoryList from "../pages/product/accessory/AccessoryList";
import AccessoryDetail from "../pages/product/accessory/AccessoryDetail";
import { Children } from "react";
import DashBoardLayout from "../layouts/DashBoardLayout";
import Products from "../pages/dashboard/ProductsManage";
import EmailLoading from "../pages/authentication/EmailLoading";

const routes = [
  {
    errorElement: <Error />,
    path: "/",
    children: [
      {
        element: <DashBoardLayout />,
        path: "/admin",
        children: [
          {
<<<<<<< HEAD
            path: "/test",
            element: <Test />,
=======
            element: <Products />,
            path: "/admin/products",
>>>>>>> 497bf56ce0cfce3c6b524970ed9057fa5736cd4e
          },
        ],
      },
      {
        element: <MainLayout />,
        path: "/",
        children: [
          {
<<<<<<< HEAD
            path: "/",
            element: <Home />,
          },
          {
            path: "authentication/login",
            element: <Login />,
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
=======
>>>>>>> 497bf56ce0cfce3c6b524970ed9057fa5736cd4e
            children: [
              {
                element: <Test />,
                path: "/test",
              },
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
                path: "authentication/email-redirect",
              },
              {
                element: <EmailLoading />,
                path: "authentication/verify-email",
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
                    path: "diamond/detail",
                    element: <DiamondDetail />,
                  },
                  {
                    path: "accessory",
                    element: <AccessoryList />,
                  },
                  {
                    path: "accessory/detail",
                    element: <AccessoryDetail />,
                  },
                ],
              },
            ],
          },
        ],
      },
    ],
  },
];

export default routes;
