import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import '../../domain/authentication_firebase_provider.dart';
import '../../domain/google_sign_in_provider.dart';
import '../../models/authentication_detail.dart';

class UserRepository {
  UserRepository(
      {this.authenticationFirebaseProvider, this.googleSignInProvider});

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;
  late Timer timer;
  bool isVerified = false;
  final logger = Logger();
  final AuthenticationFirebaseProvider? authenticationFirebaseProvider;
  final GoogleSignInProvider? googleSignInProvider;
  Future<User?> signUp(String email, String password) async {
    try {
        final auth = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        return auth.user;
     
    } catch (e) {
      logger.d(e.toString());
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      logger.d(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String?> getCurrentUser() async {
    return firebaseAuth.currentUser?.email;
  }

  Stream<AuthenticationDetail> getAuthDetailStream() {
    return authenticationFirebaseProvider!.getAuthStates().map((user) {
      return _getAuthCredentialFromFirebaseUser(user: user);
    });
  }

  Future<AuthenticationDetail> authenticateWithGoogle() async {
    User? user = await authenticationFirebaseProvider!
        .login(credential: await googleSignInProvider!.login());
    return _getAuthCredentialFromFirebaseUser(user: user);
  }

  Future<void> unAuthenticate() async {
    await googleSignInProvider!.logout();
    await authenticationFirebaseProvider!.logout();
  }

  AuthenticationDetail _getAuthCredentialFromFirebaseUser(
      {required User? user}) {
    AuthenticationDetail authDetail;
    if (user != null) {
      authDetail = AuthenticationDetail(
        isValid: true,
        uid: user.uid,
        email: user.email,
        photoUrl: user.photoURL,
        name: user.displayName,
      );
    } else {
      authDetail = AuthenticationDetail(isValid: false);
    }
    return authDetail;
  }

  Future<void> checkEmailVerified() async {
    user = firebaseAuth.currentUser;
    user?.emailVerified;
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = firebaseAuth.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      logger.d(e);
    }
  }
}
