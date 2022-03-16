import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/widgets/app_button.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';
import '../../../router/router_constant.dart';
import 'bloc/email_bloc.dart';

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
    context.read<AuthenticationBloc>().add(VerificationMailSent());
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Verifying Your Email...Please Wait.."),
          duration: Duration(seconds: 3),
          backgroundColor: Styleguide.colorGreen_1,
        ),
      );
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('An email has been sent to ${user.email} \n Please verify....',textAlign: TextAlign.center, style:Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w400
                        ),),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          AppButton(
              child: const Text('Resend email'),
              onPressed: () => context
                  .read<AuthenticationBloc>()
                  .add(VerificationMailSent())),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:  Text("Email Verified...."),
          duration: Duration(seconds: 3),
          backgroundColor: Styleguide.colorGreen_1,
        ),
      );
      context.router.pushNamed(RouterConstant.homescreen);
    }
  }
}
