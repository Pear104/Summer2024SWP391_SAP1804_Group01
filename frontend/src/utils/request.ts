import { getCookie } from "./cookie";

export const GET = async (url: string) => {
  const data: any = await (
    await fetch(import.meta.env.VITE_SERVER_URL + url, {
      method: "GET",
      headers: {
        Accept: "application/json, text/plain",
        "Content-Type": "application/json;charset=UTF-8",
        Authorization: `Bearer ${getCookie("accessToken")}`,
      },
    })
  ).json();
  return data;
};

export const POST = async (url: string, body: any) => {
  console.log(getCookie("accessToken"));
  const data: any = await (
    await fetch(import.meta.env.VITE_SERVER_URL + url, {
      method: "POST",
      headers: {
        Accept: "application/json, text/plain",
        "Content-Type": "application/json;charset=UTF-8",
        Authorization: `Bearer ${getCookie("accessToken")}`,
      },
      body: JSON.stringify(body),
    })
  ).json();
  return data;
};

export const PUT = async (url: string, body: any) => {
  const data: any = await (
    await fetch(import.meta.env.VITE_SERVER_URL + url, {
      method: "PUT",
      headers: {
        Accept: "application/json, text/plain",
        "Content-Type": "application/json;charset=UTF-8",
        Authorization: `Bearer ${getCookie("accessToken")}`,
      },
      body: JSON.stringify(body),
    })
  ).json();
  return data;
};

export const DELETE = async (url: string, body: any) => {
  const data: any = await (
    await fetch(import.meta.env.VITE_SERVER_URL + url, {
      method: "DELETE",
      headers: {
        Accept: "application/json, text/plain",
        "Content-Type": "application/json;charset=UTF-8",
        Authorization: `Bearer ${getCookie("accessToken")}`,
      },
      body: JSON.stringify(body),
    })
  ).json();
  return data;
};
