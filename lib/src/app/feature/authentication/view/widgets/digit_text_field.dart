import 'package:flutter/material.dart';

class DigitTextField extends StatefulWidget {
  final FocusNode focusNode;
  final double height;
  final double width;
  final Function(String) onFilled;

  DigitTextField({
    required this.focusNode,
    required this.height,
    required this.width,
    required this.onFilled,
  });

  @override
  _DigitTextFieldState createState() => _DigitTextFieldState();
}

class _DigitTextFieldState extends State<DigitTextField> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    this.controller = TextEditingController();
    this.controller.addListener(() {
      if (this.controller.text.length == 1) {
        widget.onFilled(this.controller.text);
      }
    });
    super.initState();
  }

  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
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
