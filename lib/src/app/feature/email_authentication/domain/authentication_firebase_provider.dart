import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationFirebaseProvider {

  AuthenticationFirebaseProvider({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;
  
  final FirebaseAuth _firebaseAuth;
  Stream<User?> getAuthStates() {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> login({
    required AuthCredential credential,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
