import 'package:flutter/material.dart';

class SplashScreenText extends StatelessWidget {
  final String mainText;
  final String richText;
  final Color richTextColor;
  final Color mainTextColor;
  const SplashScreenText(
      {super.key,
      required this.mainText,
      required this.richText,
      required this.richTextColor,
      required this.mainTextColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: mainText,
            children: [
              TextSpan(
                text: richText,
                style: TextStyle(
                  color: richTextColor,
                  fontSize: 30,
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 30,
              color: mainTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
