export default function scrollTo(id: string, block: any = "start") {
  const element = document.getElementById(id);
  if (element) {
    element.scrollIntoView({ block: block, behavior: "smooth" });
  }
}
