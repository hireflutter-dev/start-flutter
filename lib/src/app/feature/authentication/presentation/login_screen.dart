import 'package:authentication_data/authentication_data.dart';
import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';
import 'package:provider/provider.dart';

import 'viewmodel/auth_view_model.dart';
import 'widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hf_flutter_starter_kit/src/app/router/router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _selectedDialCode = 107;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void _contryCodeDialogue() async {
      await showDialog(
        context: context,
        useSafeArea: true,
        builder: (_) {
          return Card(
            color: Styleguide.main,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              decoration: const BoxDecoration(
                color: Styleguide.main,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    child: Text(
                      'Choose your Country',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < dialCodes.length; i++)
                            Material(
                              color: (_selectedDialCode == i)
                                  ? Styleguide.contrast
                                  : Styleguide.main,
                              child: SizedBox(
                                height: 45,
                                width: width * 0.8,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedDialCode = i;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          (dialCodes[i]['name']!.length > 15)
                                              ? (dialCodes[i]['name']!
                                                      .substring(0, 15) +
                                                  '...')
                                              : dialCodes[i]['name']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  color: (_selectedDialCode ==
                                                          i)
                                                      ? Styleguide.main
                                                      : Styleguide.contrast),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          '+' + dialCodes[i]['number']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  color: (_selectedDialCode ==
                                                          i)
                                                      ? Styleguide.main
                                                      : Styleguide.contrast),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        barrierDismissible: true,
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: width / 10,
          right: width / 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: const Logo(),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                height: height / 13,
                width: 8 * (width / 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: FittedBox(
                        child: Material(
                          child: InkWell(
                            onTap: () async {
                              _contryCodeDialogue();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  '+' +
                                      (dialCodes[_selectedDialCode]['number'] ??
                                          ''),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Styleguide.main),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      child: SizedBox(
                        height: height / 13,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                          ),
                          controller: _controller,
                          cursorWidth: 3,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Styleguide.main),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              AppButton(
                height: height / 13,
                width: 8 * (width / 10),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    /// Assign the value of [phoneNumber]
                    final AuthViewModel authViewModel =
                        Provider.of(context, listen: false);
                    authViewModel.setphoneNumber('+' +
                        dialCodes[_selectedDialCode]['number']! +
                        ' ' +
                        _controller.text);
                    context.router.push(const LoginVerifyScreen());
                  }
                },
                child: Text(
                  'SEND OTP',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
