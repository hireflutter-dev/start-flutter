import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({Key? key, required this.image, required this.ontap,  this.radius})
      : super(key: key);
  final String image;
  final VoidCallback ontap;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: InkWell(
        onTap: ontap,
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: radius,
        ),
      ),
    );
  }
}
