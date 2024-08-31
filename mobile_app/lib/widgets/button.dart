import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color buttonColor;
  final bool isProgress;

  const Button(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonColor,
      required this.isProgress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isProgress ? null : onPressed,
        style: TextButton.styleFrom(
          fixedSize: const Size(100, 50),
          side: BorderSide(
            color: isProgress ? Colors.grey : buttonColor,
            width: 3,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            color: isProgress ? Colors.grey : buttonColor,
          ),
        ));
  }
}
