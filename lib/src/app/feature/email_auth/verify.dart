import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/widgets/app_button.dart';
import '../../router/router_constant.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;

  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('An email has been sent to ${user.email} please verify'),
          SizedBox(
            height: height * 0.1,
          ),
          AppButton(
              child: const Text('Resend email'),
              onPressed: () => sendVerificationEmail()),
          TextButton(
              onPressed: () {
                context.router.pushNamed(RouterConstant.loginviewscreen);
              },
              child: const Text('Cancel'))
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      context.router.pushNamed(RouterConstant.homescreen);
    }
  }
}

Future<void> sendVerificationEmail() async {
  try {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  } catch (e) {
    print(e);
  }
}
