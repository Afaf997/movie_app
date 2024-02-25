
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseServices {
//   final _auth = FirebaseAuth.instance;
//   final _googleSignIn = GoogleSignIn();

//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser != null) {
//         // Obtain the auth details from the request
//         final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//         // Create a new credential
//         final OAuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         // Sign in with Google
//         return await _auth.signInWithCredential(credential);
//       }
//     } on FirebaseAuthException {
//       rethrow;
//     }
//   }

//   signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//   }
// }