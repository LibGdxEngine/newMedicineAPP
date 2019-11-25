import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation {
  Future<String> Signin(String email, String password);
  Future<String> Signup(String email, String password);
  Future<String> getCurrentUser();
  void Signout();
}

class Auth extends AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> Signin(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password));
    return user.uid;
  }

  Future<String> Signup(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password));
    return user.uid;
  }

  Future<String> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  void Signout() async {
    _firebaseAuth.signOut();
  }
}
