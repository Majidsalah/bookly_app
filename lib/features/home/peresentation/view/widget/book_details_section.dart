import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/books_image.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/custom_book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          child: BooksImage(
            imageUrl: books.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          books.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow:TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
        ),
        Text(
          books.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
              color: Colors.white.withOpacity(0.50),
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 8),
        CustomBookRating(
          ratingsCount: books.volumeInfo.ratingsCount ?? 20,
          averageRating: books.volumeInfo.averageRating ?? 5,
        )
      ],
    );
  }
}
