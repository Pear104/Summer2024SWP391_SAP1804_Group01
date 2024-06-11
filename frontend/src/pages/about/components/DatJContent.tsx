import GuideComponent from "./GuideComponent";
import MeasuringSizeComponent from "./MeasuringSizeComponent";
import OurTeam from "./OurTeam";
import WhyDatJ from "./WhyDatJ";
import Helping from "./Helping";

const DatJContent = () => {
  return (
    <div className="container mx-auto px-8 py-4 flex flex-col gap-5">
      <div className="text-center mt-4 mb-12">
        <h1 className="text-4xl font-bold mb-4">
          Welcome to Dat J Diamond Shop
        </h1>
        <p className="text-lg">
          Your premier destination for exquisite diamonds and fine jewelry.
        </p>
      </div>
      <WhyDatJ />
      <OurTeam />
      <GuideComponent />
      <MeasuringSizeComponent />
      <Helping />
    </div>
  );
};

export default DatJContent;
