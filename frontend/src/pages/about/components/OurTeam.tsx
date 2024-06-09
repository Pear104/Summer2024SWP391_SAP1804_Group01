import { Bird, Rabbit, Rat, Squirrel, Worm } from "lucide-react";

export default function OurTeam() {
  return (
    <>
      <div id="our-team" className="bg-slate-100 p-8">
        <div className="mb-8 bg-">
          <h2 className="text-2xl font-bold mb-4">About Us</h2>
          <p className="mb-4">
            At Dat J, we offer an unparalleled selection of certified diamonds
            and high-quality jewelry. Our mission is to provide our customers
            with exceptional service, value, and integrity. Whether you are
            looking for an engagement ring, a special gift, or a timeless piece
            for yourself, Dat J is your trusted source.
          </p>
        </div>
        <div className="mb-8">
          <h2 className="text-2xl font-bold mb-4">Meet Our Expert Team</h2>
          <div className="grid grid-cols-5 flex-wrap -mx-4">
            <div className="px-4 mb-4">
              <div className="border p-4 bg-white rounded shadow">
                <img
                  src="https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/104771810_1915515088584343_9006978133379025750_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=2RHx06Zz7xkQ7kNvgE3R0Rw&_nc_ht=scontent.fsgn5-14.fna&oh=00_AYAUTmgvas73BJoMMe05V9VV4mLOCBdVyZplTwz-4ArYNw&oe=668D79B5"
                  alt="Team Member"
                  className="border mb-4 rounded-full w-32 h-32 mx-auto"
                />
                <div className="flex gap-2">
                  <h3 className="text-xl font-bold mb-2">Duc Dao</h3>
                </div>
                <p className="text-gray-700">Member</p>
              </div>
            </div>
            <div className="px-4 mb-4">
              <div className="p-4 bg-white rounded shadow">
                <img
                  src="https://scontent.fsgn5-12.fna.fbcdn.net/v/t1.6435-9/105587315_2809271965985735_6434170634781336304_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ziqKfMoFYp0Q7kNvgGZTnbO&_nc_ht=scontent.fsgn5-12.fna&oh=00_AYBLFy0f31axuukwfAZXK_4SChH7BLLGqxZGwRmZYwzwkQ&oe=668D55C0"
                  alt="Team Member"
                  className="border mb-4 rounded-full w-32 h-32 mx-auto bg-blue-50"
                />
                <div className="flex gap-2">
                  <h3 className="text-xl font-bold mb-2">Dat Nguyen</h3>
                </div>
                <p className="text-gray-700">Member</p>
              </div>
            </div>
            <div className="px-4 mb-4">
              <div className="border p-4 bg-white rounded shadow">
                <img
                  src="https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/104677976_2809271969319068_9112102525922917023_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=CZpvzVIAJb4Q7kNvgEiDmJ3&_nc_ht=scontent.fsgn5-10.fna&oh=00_AYAjjEft7_1FMBBJ0-YigeZ8HZdDaC3QBP02xefjgKqxXg&oe=668D459E"
                  alt="Team Member"
                  className="border mb-4 rounded-full w-32 h-32 mx-auto"
                />
                <div className="flex gap-2">
                  <h3 className="text-xl font-bold mb-2">Anh Do</h3>
                </div>
                <p className="text-gray-700">Member</p>
              </div>
            </div>
            <div className="px-4 mb-4">
              <div className="p-4 bg-white rounded shadow">
                <img
                  src="https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/106206583_2809271952652403_5973273216644613965_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=K00HrzzgWIUQ7kNvgFVJSrG&_nc_ht=scontent.fsgn5-10.fna&oh=00_AYBLz_kK5zk2OlCWl-xb0fGvugzeq1BjcHZBxT-oNNaGCA&oe=668D6B36"
                  alt="Team Member"
                  className="border mb-4 rounded-full w-32 h-32 mx-auto"
                />
                <div className="flex gap-2">
                  <h3 className="text-xl font-bold mb-2">Duong Vo</h3>
                </div>
                <p className="text-gray-700">Member</p>
              </div>
            </div>
            <div className="px-4 mb-4">
              <div className="p-4 bg-white rounded shadow">
                <img
                  //   src="https://robohash.org/truong"
                  src="https://firebasestorage.googleapis.com/v0/b/datj-diamond.appspot.com/o/files%2Fimages.jfif?alt=media&token=b84aa567-6084-4dcd-9644-be819f5f54f8"
                  alt="Team Member"
                  className="border mb-4 rounded-full w-32 h-32 mx-auto bg-lime-500"
                />
                <div className="flex gap-2">
                  <h3 className="text-xl font-bold mb-2">Truong Le</h3>
                </div>
                <p className="text-gray-700">Leader</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
