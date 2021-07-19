import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  List<FocusNode> focusNodes = [];
  List<String> digits = [];
  late FirebaseAuth firebaseAuthInstance;
  PhoneAuthCredential? phoneAuthCredential;
  UserCredential? userCredential;
  String verificationID = '';
  int? forceResendToken;
  // int? forceResendToken;
  bool codeSent = false;
  String smsCode = '';

  bool hasTimedOut = false;
  bool verified = false;
  bool hasFailed = false;
  FirebaseAuthException? failureException;
  String? phoneNumber;

  void setphoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void verifyPhoneNumber([bool isResend = false]) {
    firebaseAuthInstance = FirebaseAuth.instance;
    firebaseAuthInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber!,
      verificationCompleted: (credential) {
        phoneAuthCredential = credential;
        phoneSignIn();
      },
      verificationFailed: (exception) {
        this.failureException = exception;

        this.hasFailed = false;
        this.hasTimedOut = false;
        print(exception.message);

        // Get.showSnackbar(GetBar(
        //   message: exception.message,
        //   duration: Duration(seconds: 10),
        // ));
      },
      codeSent: (verificationID, resendToken) {
        this.verificationID = verificationID;
        this.forceResendToken = resendToken;
        this.codeSent = true;
      },
      codeAutoRetrievalTimeout: (verificationID) {
        this.hasTimedOut = true;

        this.verificationID = verificationID;
      },
      forceResendingToken: forceResendToken,
      timeout: Duration(seconds: 30),
    );

    if (isResend) {
      // Get.showSnackbar(GetBar(
      //   message: 'Resent',
      //   duration: Duration(seconds: 1),
      // ));
    }
    notifyListeners();
  }

  Future<void> signInWithPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
    ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
        phoneNumber!,
        RecaptchaVerifier(
          container: 'recaptcha',
          size: RecaptchaVerifierSize.compact,
          theme: RecaptchaVerifierTheme.dark,
        ));

    await confirmationResult.confirm('123456');
    notifyListeners();
  }

  void whenTimeOut() {
    smsCode = '';
    hasTimedOut = false;
    verified = false;
    hasFailed = false;
    notifyListeners();
  }

  Future<bool> phoneSignIn() async {
    firebaseAuthInstance = FirebaseAuth.instance;
    final UserCredential userCredential =
        await firebaseAuthInstance.signInWithCredential(phoneAuthCredential!);

    if ((userCredential.user != null)) {
      return true;
    } else {
      return false;
    }
  }
}
