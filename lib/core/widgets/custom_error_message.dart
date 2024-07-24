import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Styles.textStyle18,
    );
  }
}
