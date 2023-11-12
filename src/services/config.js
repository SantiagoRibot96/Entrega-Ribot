import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyAte66wr2gkug1kPYQJWoi7M6FFlI8_UNo",
  authDomain: "todoparrillas-be4ea.firebaseapp.com",
  projectId: "todoparrillas-be4ea",
  storageBucket: "todoparrillas-be4ea.appspot.com",
  messagingSenderId: "73368551427",
  appId: "1:73368551427:web:887bd4e89df83c1f590e36"
};

const app = initializeApp(firebaseConfig);

export const db = getFirestore(app);