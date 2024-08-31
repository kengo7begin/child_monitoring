import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color buttonColor;
  const Button(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: const Size(100, 50),
          side: BorderSide(
            color: buttonColor,
            width: 3,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            color: buttonColor,
          ),
        ));
  }
}
