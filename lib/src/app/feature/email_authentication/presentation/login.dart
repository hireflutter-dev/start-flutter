import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/email_authentication/presentation/bloc/email_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/router/router_constant.dart';

import '../../../../config/color_config.dart';
import '../../authentication/presentation/widgets/app_button.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Login"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: const TextStyle(fontSize: 20.0),
                    border: const OutlineInputBorder(),
                    errorStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Styleguide.colorRed_3,
                        ),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: const TextStyle(fontSize: 20.0),
                    border: const OutlineInputBorder(),
                    errorStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Styleguide.colorRed_3,
                        ),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    } else if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      height: MediaQuery.of(context).size.height / 20,
                      backgroundColor: Styleguide.colorTransparent,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthenticationBloc>().add(
                              SignInButtonPressed(
                                  email: emailController.text,
                                  password: passwordController.text));
                        }
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Styleguide.colorRed_1,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocListener<AuthenticationBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSucceed) {
                    context.router.pushNamed(RouterConstant.homescreen);
                  }
                  if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<AuthenticationBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () =>
                          {context.router.pushNamed(RouterConstant.signup)},
                      child: const Text('Signup'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
