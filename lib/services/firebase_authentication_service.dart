import 'package:firebase_auth/firebase_auth.dart';
import 'package:honor_store/model/user.dart';

class FirebaseAuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  User currentUser(FirebaseUser user) {
    return user == null ? null : User(id: user.uid);
  }

  Future<FirebaseUser> signUp({String email, String pw, String name}) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pw);
    FirebaseUser user = result.user;
    return user;
  }

  Future<FirebaseUser> login({String email, String pw}) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pw);
    FirebaseUser user = result.user;
    return user;
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(currentUser);
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
