import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/core/image_constant.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageConstant.logo);
  }
}
