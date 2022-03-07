import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/widgets/app_button.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';
import '../../router/router_constant.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Styleguide.colorGreen_1,
            content: Text(
              "Email Successfully sent...",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
          context.router.pushNamed(RouterConstant.verifyscreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Styleguide.colorAccentsOrange_1,
            content: Text(
              "Password Provided is too Weak",
              style: Theme.of(context).textTheme.headline5!.copyWith(color: Styleguide.colorTransparent,),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Styleguide.colorAccentsOrange_1,
              content: Text(
                "Account Already exists",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Styleguide.colorTransparent,
                    ),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and Confirm Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Styleguide.colorAccentsOrange_1,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Styleguide.colorTransparent,
                ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User SignUp"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
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
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password: ',
                    labelStyle: Theme.of(context).textTheme.headline4,
                    border: const OutlineInputBorder(),
                    errorStyle: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Styleguide.colorRed_3,
                        ),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
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
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                            confirmPassword = confirmPasswordController.text;
                          });
                          registration();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Styleguide.colorRed_1,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account? "),
                    TextButton(
                        onPressed: () => {
                              context.router
                                  .pushNamed(RouterConstant.loginwithemail)
                            },
                        child: const Text('Login'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
