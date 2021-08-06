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
  ConfirmationResult? confirmationResult;
  bool codeSent = false;
  String smsCode = '';

  bool hasTimedOut = false;
  bool verified = false;
  bool hasFailed = false;
  FirebaseAuthException? failureException;
  String? phoneNumber;

  void setphoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber;
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
        failureException = exception;

        hasFailed = false;
        hasTimedOut = false;

        // Get.showSnackbar(GetBar(
        //   message: exception.message,
        //   duration: Duration(seconds: 10),
        // ));
      },
      codeSent: (verificationID, resendToken) {
        verificationID = verificationID;
        forceResendToken = resendToken;
        codeSent = true;
      },
      codeAutoRetrievalTimeout: (verificationID) {
        hasTimedOut = true;

        verificationID = verificationID;
      },
      forceResendingToken: forceResendToken,
      timeout: const Duration(seconds: 30),
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
    confirmationResult = await auth.signInWithPhoneNumber(phoneNumber!);
  }

  Future<bool> verifySmsCodeWeb() async {
    try {
      final UserCredential? userCredential =
          await confirmationResult?.confirm(smsCode);

      return userCredential?.user?.uid != null ? true : false;
    } on FirebaseAuthException catch (e) {
      if (e.message?.contains(
              'phone auth credential is invalid. Please resend the verification code sms') ==
          true) {
        throw Exception('Invalid OTP');
      }
    }
    return false;
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
