import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/authentication/presentation/widgets/app_button.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';

import '../../router/router_constant.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
    final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
       context.router.pushNamed(RouterConstant.homescreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: Theme.of(context).textTheme.headline5!.copyWith(color:Styleguide.colorTransparent ),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Styleguide.colorTransparent),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
       emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Styleguide.colorRed_3),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
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
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Styleguide.colorRed_3),
                  ),
                  controller: passwordController,
                  validator: (value) {
                     RegExp regex =  RegExp(r'^.{6,}$');
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    if (!regex.hasMatch(value)) {
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
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child:  Text(
                        'Login',
                        style: Theme
                        .of(context)
                        .textTheme
                        .headline5!.copyWith(
                              color: Styleguide.colorRed_1,
                            ),
                      ),
                    ),
                   
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        context.router.pushNamed(RouterConstant.signup)
                      },
                      child: Text('Signup'),
                    ),
                   
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
