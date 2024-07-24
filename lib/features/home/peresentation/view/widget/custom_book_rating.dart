import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookRating extends StatelessWidget {
  const CustomBookRating({
    super.key,
    this.ratingsCount,
    this.averageRating,
  });
  final int? ratingsCount;
  final int? averageRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 13,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(averageRating.toString(),
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 8,
        ),
        Text(
          "(${ratingsCount.toString()})",
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.50),
          ),
        )
      ],
    );
  }
}
