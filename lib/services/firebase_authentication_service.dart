import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:honor_store/model/user.dart';

class FirebaseAuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Future<bool> signUp({String email, String pw, String name}) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pw);
    if (result.user != null) {
      await _firebaseAuth.signOut();
      return true;
    }
    return false;
  }

  Future<bool> login({String email, String pw}) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pw);
    return result.user != null;
  }

  Stream<FirebaseUser> get onAuthStateChanged {
    setCurrentUser();
    return _firebaseAuth.onAuthStateChanged;
  }

  void setCurrentUser() async {
    firebaseUser = await _firebaseAuth.currentUser();
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  Future<bool> loginWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount account = await googleSignIn.signIn();
    if (account != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await account.authentication;

      AuthResult result = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken));
      setCurrentUser();
      return result != null;
    }
    return false;
  }

  Future<bool> loginWithFacebook() async {
    AuthResult authResult;
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email', 'public_profile']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken = result.accessToken;
      AuthCredential authCredential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token);
      authResult = await _firebaseAuth.signInWithCredential(authCredential);
      setCurrentUser();
    }
    return authResult != null;
  }
}
