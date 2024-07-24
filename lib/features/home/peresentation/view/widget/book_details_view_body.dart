import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/book_details_section.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/book_price_free_preview.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/custom_book_details_appBar.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookdetailsAppBar(),
                  BookDetailsSection(
                    books: books,
                  ),
                  const SizedBox(height: 30),
                  BookPriceAndFreePreview(
                    books: books,
                  ),
                  const Expanded(child: SizedBox(height: 40)),
                  SimilarBooksSection(
                    books: books,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
