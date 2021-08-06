import 'package:flutter/material.dart';

class DigitTextField extends StatefulWidget {
  const DigitTextField({
    Key? key,
    required this.focusNode,
    required this.height,
    required this.width,
    required this.onFilled,
  }) : super(key: key);

  final FocusNode focusNode;
  final double height;
  final double width;
  final Function(String) onFilled;

  @override
  _DigitTextFieldState createState() => _DigitTextFieldState();
}

class _DigitTextFieldState extends State<DigitTextField> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      if (controller.text.length == 1) {
        widget.onFilled(controller.text);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        controller: controller,
        focusNode: widget.focusNode,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
