import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksImage extends StatelessWidget {
  const BooksImage({super.key, required this.imageUrl});
  final String ?imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: CachedNetworkImage(
          fadeOutDuration: const Duration(seconds: 2),
          fadeInDuration: const Duration(seconds: 2),
          fit: BoxFit.fill,
          errorWidget: (context, url, error) =>
              const Icon(FontAwesomeIcons.circleExclamation),
          imageUrl: imageUrl!,
        ),
      ),
    );
  }
}
