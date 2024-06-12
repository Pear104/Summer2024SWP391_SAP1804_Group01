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
import DiamondsManage from "../pages/dashboard/diamond/DiamondsManage";
import EmailLoading from "../pages/authentication/EmailLoading";
import ForgetPassword from "../pages/authentication/ForgetPassword";
import ResetPasswordForm from "../pages/authentication/ResetPasswordForm";
import Dashboard from "../pages/dashboard/Dashboard";
import Cart from "../pages/cart/Cart";
import Test from "../pages/test/Test";
import OrderDetail from "../pages/account/OrderDetail";
import EditAccount from "../pages/account/EditAccount";
import CompleteProduct from "../pages/product/complete/CompleteProduct";
import BlogsManage from "../pages/dashboard/blog/BlogsManage";
import NewBlog from "../pages/dashboard/blog/NewBlog";
import AccessoriesManage from "../pages/dashboard/accessory/AccessoriesManage";
import AccessoryView from "../pages/dashboard/accessory/AccessoryView";
import DiamondPriceManage from "../pages/dashboard/diamondprice/DiamondPriceManage";
import AccessoryPriceManage from "../pages/dashboard/accessoryprice/AccessoryPriceManage";
import CustomerManage from "../pages/dashboard/customer/CustomerManage";
import TransactionManage from "../pages/dashboard/transacction/TransactionManage";
import OrderManage from "../pages/dashboard/order/OrderManage";
import DiamondView from "../pages/dashboard/diamond/DiamondView";
import CheckoutLayout from "../layouts/CheckoutLayout";
import CheckoutInfo from "../pages/checkout/CheckoutInfo";
import CheckoutPayment from "../pages/checkout/CheckoutPayment";
import About from "../pages/about/About";
import WarrantyRequestList from "../pages/account/WarrantyRequestList";
import CreateWarrantyRequest from "../pages/account/CreateWarrantyRequest";
import SaleStaffsManagement from "../pages/dashboard/sale_staffs/SaleStaffsManagement";
import DeliveryStaffsManagement from "../pages/dashboard/delivery_staffs/DeliveryStaffsManagement";

const routes = [
  {
    errorElement: <Error />,
    path: "/",
    children: [
      {
        path: "checkout",
        element: <CheckoutLayout />,
        children: [
          {
            index: true,
            element: <CheckoutInfo />,
          },
          {
            path: "payment",
            element: <CheckoutPayment />,
          },
        ],
      },
      {
        element: <DashBoardLayout />,
        path: "/admin",
        children: [
          {
            index: true,
            element: <Dashboard />,
          },
          {
            path: "/admin/diamonds",
            children: [
              {
                index: true,
                element: <DiamondsManage />,
              },
              {
                element: <DiamondView />,
                path: "/admin/diamonds/new",
              },
              {
                element: <DiamondView />,
                path: "/admin/diamonds/detail/:diamondId",
              },
            ],
          },
          {
            element: <DiamondPriceManage />,
            path: "/admin/diamond-price",
          },
          {
            element: <OrderManage />,
            path: "/admin/order",
          },
          {
            element: <SaleStaffsManagement />,
            path: "/admin/sale-staffs",
          },
          {
            element: <DeliveryStaffsManagement />,
            path: "/admin/delivery-staffs",
          },
          {
            element: <AccessoryPriceManage />,
            path: "/admin/accessory-price",
          },
          {
            element: <CustomerManage />,
            path: "/admin/customers",
          },
          {
            element: <OrderManage />,
            path: "/admin/orders",
          },
          {
            element: <TransactionManage />,
            path: "/admin/transactions",
          },
          {
            element: <BlogsManage />,
            path: "/admin/blogs",
            children: [
              {
                index: true,
                element: <BlogsManage />,
              },
              {
                element: <NewBlog />,
                path: "/admin/blogs/new",
              },
            ],
          },
          {
            path: "/admin/accessories",
            children: [
              {
                index: true,
                element: <AccessoriesManage />,
              },
              {
                path: "/admin/accessories/detail",
                children: [
                  {
                    index: true,
                    element: <AccessoryView />,
                  },
                  {
                    path: "/admin/accessories/detail/:accessoryId",
                    element: <AccessoryView />,
                  },
                ],
              },
            ],
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
            path: "/about",
            element: <About />,
          },
          {
            path: "authentication",
            children: [
              {
                path: "login",
                element: <Login />,
              },
              {
                element: <Register />,
                path: "register",
              },
              {
                element: <EmailLoading />,
                path: "verify-gmail",
              },
              {
                element: <ConfirmEmail />,
                path: "email-redirect",
              },
              {
                element: <ResetPasswordForm />,
                path: "reset-password",
              },
              {
                element: <ForgetPassword />,
                path: "forget-password",
              },
            ],
          },
          {
            path: "/cart",
            element: <Cart />,
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
                path: "edit",
                element: <EditAccount />,
              },
              {
                element: <OrderHistory />,
                path: "order-history",
              },
              {
                element: <OrderDetail />,
                path: "order-history/detail",
              },
              {
                element: <WarrantyRequestList />,
                path: "warranty",
              },
              {
                element: <CreateWarrantyRequest />,
                path: "warranty/request",
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
                path: "/product/diamond/detail/:diamondId",
                element: <DiamondDetail />,
              },
              {
                path: "/product/accessory",
                element: <AccessoryList />,
              },
              {
                path: "/product/accessory/detail/:accessoryId",
                element: <AccessoryDetail />,
              },
              {
                path: "/product/complete",
                element: <CompleteProduct />,
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
