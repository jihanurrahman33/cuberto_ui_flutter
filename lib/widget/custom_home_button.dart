import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  final Color? buttonIconColor;
  final IconData? buttonIcon;
  final Color? buttonTextColor;
  final double? buttonHeight;
  final double buttonWidth;

  final Color buttonColor;
  const CustomHomeButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      required this.buttonColor,
      this.buttonIcon,
      this.buttonIconColor,
      this.buttonTextColor,
      this.buttonHeight,
      required this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                buttonIcon,
                color: buttonIconColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
