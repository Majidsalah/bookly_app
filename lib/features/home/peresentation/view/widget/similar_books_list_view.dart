import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/peresentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/books_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  Padding(
                padding:const EdgeInsets.only(right: 9.0),
                child: BooksImage(
                  imageUrl:
                     state.books[index].volumeInfo.imageLinks.thumbnail ,
                ),
              ),
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomErrorMessage(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
