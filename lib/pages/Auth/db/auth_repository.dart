import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RepositoryAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    final _googleUser = await _googleSignIn.signIn();
    final _googleAuth = await _googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    //firebase sign in
    final authResult = await _auth.signInWithCredential(credential);

    //extract token
    User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    await _createUserCollectionFirebase(_auth.currentUser!);
  }

  Future<void> _createUserCollectionFirebase(dynamic doc) async {
    var userDoc =
        await FirebaseFirestore.instance.collection('user').doc(doc.uid).get();

    if (!userDoc.exists) {
      await FirebaseFirestore.instance.collection('user').doc(doc.uid).set({
        'id': doc.uid,
        'isTaker': false,
        'name': doc.displayName,
      });
    } else {
      print('user already exists');
      return;
    }
  }

  Future<bool> isTaker(String uid) async {
    var userDoc =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();

    return userDoc.data()!['isTaker'];
  }
}
