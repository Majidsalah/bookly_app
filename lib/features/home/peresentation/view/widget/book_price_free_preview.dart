import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:bookly_app/core/widgets/custom_buttom.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPriceAndFreePreview extends StatelessWidget {
  const BookPriceAndFreePreview({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtom(
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            onPressed: () {},
            child: Text(
              'Free',
              style: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        Expanded(
          child: CustomButtom(
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            onPressed: () async {
              final Uri _url = Uri.parse("${books.volumeInfo.previewLink}");

              if (await canLaunchUrl(_url)) {
                await launchUrl(_url);
              }
            },
            child: Text(
              'Book Preview',
              style: Styles.textStyle16.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
