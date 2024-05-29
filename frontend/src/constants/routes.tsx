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
import DiamondDetail from "../pages/product/diamond/DiamondDetail";
import AccessoryList from "../pages/product/accessory/AccessoryList";
import AccessoryDetail from "../pages/product/accessory/AccessoryDetail";
import DashBoardLayout from "../layouts/DashBoardLayout";
import Products from "../pages/dashboard/ProductsManage";
import EmailLoading from "../pages/authentication/EmailLoading";
import ForgetPassword from "../pages/authentication/ForgetPassword";
import ResetPasswordForm from "../pages/authentication/ResetPasswordForm";
import Dashboard from "../pages/dashboard/Dashboard";
import Test from "../pages/test/Test";

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
            index: true,
            element: <Dashboard />,
          },
          {
            element: <Products />,
            path: "/admin/products",
          },
        ],
      },
      {
        element: <MainLayout />,
        path: "/",
        children: [
          {
            path: "/",
            element: <Home />,
          },
          {
            path: "/authentication",
            children: [
              {
                path: "/authentication/login",
                element: <Login />,
              },
              {
                element: <Register />,
                path: "/authentication/register",
              },
              {
                element: <EmailLoading />,
                path: "/authentication/verify-gmail",
              },
              {
                element: <ConfirmEmail />,
                path: "/authentication/email-redirect",
              },
              {
                element: <ResetPasswordForm />,
                path: "/authentication/reset-password",
              },
              {
                element: <ForgetPassword />,
                path: "/authentication/forget-password",
              },
            ],
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
                path: "/product/diamond",
                element: <DiamondList />,
              },
              {
                path: "/product/diamond/detail",
                element: <DiamondDetail />,
              },
              {
                path: "/product/accessory",
                element: <AccessoryList />,
              },
              {
                path: "/product/accessory/detail",
                element: <AccessoryDetail />,
              },
            ],
          },
          {
            path: "/test",
            element: <Test />,
          },
        ],
      },
    ],
  },
];

export default routes;
