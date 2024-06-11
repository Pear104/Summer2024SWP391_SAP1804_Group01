export default function MeasuringSizeComponent() {
  return (
    <div
      id="measure-guide"
      className="mb-8 bg-slate-100 p-14 border border-gray-300 rounded-md"
    >
      <h2 className="text-4xl font-bold mb-16 text-red-500">
        How to Measure the Size of Your Finger
      </h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div className="mb-4">
          {/* <img
              src="https://source.unsplash.com/600x400/?string,finger"
              alt="Use a String or Paper Strip"
              className="mb-4 w-full rounded-md"
            /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 1: Use a String or Paper Strip
          </h3>
          <p className="text-gray-700 pl-5">
            Take a piece of string or a strip of paper and wrap it around the
            base of your finger. Make sure it is snug but not too tight.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
              src="https://source.unsplash.com/600x400/?mark,pen"
              alt="Mark the Overlap Point"
              className="mb-4 w-full rounded-md"
            /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 2: Mark the Overlap Point
          </h3>
          <p className="text-gray-700 pl-5">
            Use a pen to mark the point where the string or paper overlaps. This
            will help you measure the circumference of your finger.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
              src="https://source.unsplash.com/600x400/?ruler,measure"
              alt="Measure the Length"
              className="mb-4 w-full rounded-md"
            /> */}
          <h3 className="text-xl font-bold mb-2">Step 3: Measure the Length</h3>
          <p className="text-gray-700 pl-5">
            Lay the string or paper flat and use a ruler to measure the length
            up to the mark you made. This measurement is the circumference of
            your finger.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
              src="https://source.unsplash.com/600x400/?ring,size"
              alt="Use a Ring Size Chart"
              className="mb-4 w-full rounded-md"
            /> */}
          <h3 className="text-xl font-bold mb-2">
            Step 4: Use a Ring Size Chart
          </h3>
          <p className="text-gray-700 pl-5">
            Compare your measurement with a ring size chart to find your
            corresponding ring size. Ring size charts are widely available
            online and in stores.
          </p>
        </div>
        <div className="mb-4">
          {/* <img
              src="https://source.unsplash.com/600x400/?tips,finger"
              alt="Additional Tips"
              className="mb-4 w-full rounded-md"
            /> */}
          <h3 className="text-xl font-bold mb-2">Additional Tips</h3>
          <p className="text-gray-700 pl-5">
            Measure your finger at the end of the day when it is likely to be
            largest. Avoid measuring when your hands are cold, as your fingers
            may be smaller.
          </p>
        </div>
      </div>
    </div>
  );
}
