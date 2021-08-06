import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/config/color_config.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.radius,
    this.height,
    this.width,
  }) : super(key: key);

  final Widget child;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 100),
      child: Material(
        color: backgroundColor ?? Styleguide.style,
        child: MaterialButton(
          height: height,
          minWidth: width,
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: child,
          ),
        ),
      ),
    );
  }
}
