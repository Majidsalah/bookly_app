import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also Like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
         SimilarBooksListView(books:books ,),
      ],
    );
  }
}
