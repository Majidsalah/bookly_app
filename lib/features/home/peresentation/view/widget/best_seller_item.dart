import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:bookly_app/core/utiles/router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/books_image.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/custom_book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem(this.books, {super.key});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: books),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.6 / 4,
                child: BooksImage(
                  imageUrl: books.volumeInfo.imageLinks.thumbnail,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      maxLines: 2,
                      books.volumeInfo.title!,
                      style: Styles.textStyle20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    books.volumeInfo.authors![0],
                    style: Styles.textStyle14.copyWith(
                        color: Colors.white.withOpacity(0.70),
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle16.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 44.3,
                      ),
                      CustomBookRating(
                        ratingsCount: books.volumeInfo.ratingsCount ?? 20,
                        averageRating: books.volumeInfo.averageRating ?? 5,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
