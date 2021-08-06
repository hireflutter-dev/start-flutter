import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/widgets/widgets.dart';
import 'package:hf_flutter_starter_kit/src/app/router/router_constant.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/auth_view_model.dart';

class LoginVerifyScreen extends StatefulWidget {
  const LoginVerifyScreen({Key? key}) : super(key: key);

  @override
  _LoginVerifyScreenState createState() => _LoginVerifyScreenState();
}

class _LoginVerifyScreenState extends State<LoginVerifyScreen>
    with AfterLayoutMixin<LoginVerifyScreen> {
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      focusNodes.add(
        FocusNode(canRequestFocus: true),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    final AuthViewModel authViewModel = Provider.of(context, listen: false);
    try {
      if ((defaultTargetPlatform == TargetPlatform.iOS) ||
          (defaultTargetPlatform == TargetPlatform.android)) {
        authViewModel.verifyPhoneNumber();
      } else {
        await authViewModel.signInWithPhoneNumber();
      }
    } catch (e) {
      /// Show snackbar
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final AuthViewModel authViewModel = Provider.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              Text(
                'OTP sent to ${authViewModel.phoneNumber}',
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 6; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: DigitTextField(
                          focusNode: focusNodes[i],
                          height: width / 10,
                          width: width / 10,
                          onFilled: (digit) {
                            if (authViewModel.digits.isEmpty ||
                                (authViewModel.digits.length <= i)) {
                              authViewModel.digits.add(digit);
                            } else {
                              authViewModel.digits[i] = digit;
                            }
                            focusNodes[i].unfocus();
                            if (i != 5) {
                              focusNodes[i + 1].requestFocus();
                            } else {
                              authViewModel.smsCode = '';
                              authViewModel.digits.map((element) {
                                authViewModel.smsCode += element;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (authViewModel.hasTimedOut) {
                    authViewModel.whenTimeOut();
                    authViewModel.verifyPhoneNumber(true);
                  } else {
                    // Get.showSnackbar(GetBar(
                    //   message:
                    //       'Please wait for Half a minute before resending code',
                    //   duration: Duration(seconds: 2),
                    // ));
                  }
                },
                child: Text(
                  'Resend Token',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: (authViewModel.hasTimedOut)
                            ? (Styleguide.contrast)
                            : (Styleguide.contrast.withOpacity(0.5)),
                      ),
                ),
              ),
              (defaultTargetPlatform == TargetPlatform.android ||
                      defaultTargetPlatform == TargetPlatform.iOS)
                  ? _buildMobileAppButton(width, authViewModel)
                  : _buildWebAppButton(width, authViewModel),
            ],
          ),
        ),
      ),
    );
  }

  AppButton _buildMobileAppButton(double width, AuthViewModel authViewModel) {
    return AppButton(
      width: width * 0.8,
      backgroundColor: authViewModel.failureException == null
          ? Styleguide.style
          : Colors.grey,
      child: (defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS)
          ? _buildMobileButton(authViewModel)
          : _verifyButtonText(),
      onPressed: () {
        _onPressed(authViewModel);
      },
    );
  }

  Widget _buildMobileButton(AuthViewModel authViewModel) {
    return (authViewModel.codeSent && !authViewModel.verified)
        ? _verifyButtonText()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                authViewModel.failureException == null
                    ? "Validating..."
                    : "There was an error",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                width: 20,
              ),
              authViewModel.failureException == null
                  ? const SizedBox(
                      height: 25,
                      width: 25,
                      child: CupertinoActivityIndicator(),
                    )
                  : const SizedBox(),
            ],
          );
  }

  AppButton _buildWebAppButton(double width, AuthViewModel authViewModel) {
    return AppButton(
        width: width * 0.8,
        backgroundColor: authViewModel.failureException == null
            ? Styleguide.style
            : Colors.grey.shade500,
        child: _verifyButtonText(),
        onPressed: () async {
          if (await authViewModel.verifySmsCodeWeb()) {
            context.router.pushNamed(RouterConstant.homescreen);
          }
        });
  }

  Text _verifyButtonText() {
    return Text(
      'VERIFY',
      style: Theme.of(context).textTheme.headline2,
    );
  }

  void _onPressed(AuthViewModel authViewModel) async {
    authViewModel.phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: authViewModel.verificationID,
      smsCode: authViewModel.smsCode,
    );
    final bool phoneSignIn = await authViewModel.phoneSignIn();
    if (phoneSignIn) {
      context.router.pushNamed(RouterConstant.homescreen);
    } else {
      /// Show snackbar
    }
  }
}
