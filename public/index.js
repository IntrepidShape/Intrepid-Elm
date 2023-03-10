import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, signInWithPopup, signOut, GoogleAuthProvider, onAuthStateChanged } from "firebase/auth";
import { query, getFirestore, collection, addDoc, onSnapshot } from "firebase/firestore"; 
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries


const firebaseConfig = {
  apiKey: "AIzaSyBTGlMxUAFjc_VYKtcAgTbikfWdej2_fEw",
  authDomain: "intrepiddaily-3858e.firebaseapp.com",
  projectId: "intrepiddaily-3858e",
  storageBucket: "intrepiddaily-3858e.appspot.com",
  messagingSenderId: "210587901720",
  appId: "1:210587901720:web:dd9c757cd87e420dc2086d",
  measurementId: "G-NNWXC22JKP"
};

// Initialize Firebase
const firebaseApp = initializeApp(firebaseConfig);
const analytics = getAnalytics(firebaseApp);


const provider = new GoogleAuthProvider();
const auth = getAuth();
const db = getFirestore();

const app = Elm.Main.init({
  node: document.getElementById("root")
});

app.ports.signIn.subscribe(() => {
  console.log("LogIn called");
  signInWithPopup(auth, provider)
    .then(result => {
      result.user.getIdToken().then(idToken => {
        app.ports.signInInfo.send({
          token: idToken,
          email: result.user.email,
          uid: result.user.uid
        });
      });
    })
    .catch(error => {
      app.ports.signInError.send({
        code: error.code,
        message: error.message
      });
    });
});

app.ports.signOut.subscribe(() => {
  console.log("LogOut called");
  signOut(auth);
});

//  Observer on user info
onAuthStateChanged(auth, user => {
  console.log("called");
  if (user) {
    user
      .getIdToken()
      .then(idToken => {
        app.ports.signInInfo.send({
          token: idToken,
          email: user.email,
          uid: user.uid
        });
      })
      .catch(error => {
        console.log("Error when retrieving cached user");
        console.log(error);
      });

    // Set up listened on new messages
    const q = query(collection(db, `users/${user.uid}/messages`));
    onSnapshot(q, querySnapshot => {
      console.log("Received new snapshot");
      const messages = [];

      querySnapshot.forEach(doc => {
        if (doc.data().content) {
          messages.push(doc.data().content);
        }
      });

      app.ports.receiveMessages.send({
        messages: messages
      });
    });
  }
});

app.ports.saveMessage.subscribe(data => {
  console.log(`saving message to database : ${data.content}`);

  addDoc(collection(db, `users/${data.uid}/messages`), {
    content: data.content
  }).catch(error => {
      app.ports.signInError.send({
        code: error.code,
        message: error.message
      });
    });
});

registerServiceWorker();

