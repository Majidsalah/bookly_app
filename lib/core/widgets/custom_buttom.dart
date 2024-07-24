import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.onPressed,
    this.borderRadius,
  });
  final Color backgroundColor;
  final Widget child;

  final void Function() onPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16)),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
