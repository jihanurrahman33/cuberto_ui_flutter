import 'package:flutter/material.dart';

class CustomArrowButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color color;
  final double size;
  final Color? bgColor;
  final double height;
  final double width;
  const CustomArrowButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.color,
      this.bgColor,
      required this.size,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
