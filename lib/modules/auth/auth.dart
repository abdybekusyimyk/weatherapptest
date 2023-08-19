import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChenges => firebaseAuth.authStateChanges();

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
