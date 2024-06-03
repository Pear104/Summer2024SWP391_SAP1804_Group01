import { initializeApp } from "firebase/app";
import { getStorage } from "firebase/storage";
const firebaseConfig = {
  apiKey: "AIzaSyDVZoUE-6HLAhWDBsWamMnC-n4z6yVraeE",
  authDomain: "datj-diamond.firebaseapp.com",
  projectId: "datj-diamond",
  storageBucket: "datj-diamond.appspot.com",
  messagingSenderId: "1081282302994",
  appId: "1:1081282302994:web:568d468c864781ffc8b4cb",
  measurementId: "G-X7PGW3JMEY",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const storage = getStorage(app);
