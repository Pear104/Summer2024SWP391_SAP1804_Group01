import FirebaseImageUpload from "./FirebaseImageUpload";

export default function Test() {
  return (
    <div className="w-full mt-24 h-[400px] flex justify-center">
      <div className="flex justify-center flex-col">
        <div className="flex flex-col">
          <FirebaseImageUpload />
        </div>
      </div>
    </div>
  );
}
