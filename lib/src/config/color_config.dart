import 'dart:ui';

import 'package:flutter/material.dart';

/// Class for color constant
class Styleguide {
  Styleguide._();

  static Color nearBackground(ThemeData theme) =>
      theme.brightness == Brightness.light
          ? Styleguide.colorGray_1
          : Styleguide.colorGray_8;

  static const Color colorGray_0 = Color(0xffffffff);
  static const Color colorGray_1 = Color(0xfff7f7f7);
  static const Color colorGray_2 = Color(0xffdfdfdf);
  static const Color colorGray_3 = Color(0xff949494);
  static const Color colorGray_4 = Color(0xff6a6a6a);
  static const Color colorGray_5 = Color(0xff4c4c4c);
  // colorGray_8 is not part of original style guide
  static const Color colorGray_8 = Color(0xff2f2f2f);
  static const Color colorGray_9 = Color(0xff272727);

  static const Color colorGreen_1 = Color(0xff00a64b);
  static const Color colorGreen_2 = Color(0xff008c44);
  static const Color colorGreen_3 = Color(0xff006c2b);
  static const Color colorGreen_4 = Color(0xff1d5632);
  static const Color colorGreen_5 = Color(0xff0b3f1f);
  static const Color colorGreen_6 = Color(0xff004c1c);
  static const Color colorGreen_7 = Color(0xff336646);
  static const Color colorGreen_8 = Color(0xff15753e);
  static const Color colorGreen_9 = Color(0xff48bf04);

  static const Color colorGrange_1 = Color(0xffFEF7EC);
  static const Color colorGrange_2 = Color(0xffFDA503);

  static const Color colorRed_1 = Color(0xffF5EEEF);
  static const Color colorRed_2 = Color(0xff74272b);
  static const Color colorRed_3 = Color(0xffE3300C);

  static const Color colorBlue_1 = Color(0xffECF6FA);
  static const Color colorBlue_2 = Color(0xff1580c4);

  static const Color colorYellow_1 = Color(0xffFEFAEB);
  static const Color colorYellow_2 = Color(0xffFDCB04);
  static const Color colorYellow_3 = Color(0xffFFC300);
  static const Color colorAccentsYellow_1_8 = Color(0xfffec324);

  static const Color colorAccentsBlue_1 = Color(0xff699fd5);
  static const Color colorAccentsBlue_2 = Color(0xff4b88c5);
  static const Color colorAccentsBlue_3 = Color(0xff33699f);
  static const Color colorAccentsBlue_4 = Color(0xff1e497f);
  static const Color colorAccentsBlue_5 = Color(0xff073773);

  static const Color colorAccentsYellow_1 = Color(0xfffec324);
  static const Color colorAccentsYellow_2 = Color(0xffffa716);
  static const Color colorAccentsYellow_3 = Color(0xfff48326);

  static const Color colorAccentsOrange_1 = Color(0xFFFC6E26);

  static const Color colorAccentsLightGreen = Color(0xff8cc63f);

  static const Color colorAccentsRed = Color(0xffe52f52);
  static const Color colorLightNavy_8 = Color(0xff114a92);

  static const Color colorTransparent = Color(0xff000000);

  static Color white = Colors.white;

  static const main = Color(0xFF1B2230);
  static const contrast = Colors.white;
  static const style = Colors.green;
  // static const style = Color(0xFFE94C2B);
  static const alternative = Color(0xFF3548A9);
  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [style, alternative],
  );
}
