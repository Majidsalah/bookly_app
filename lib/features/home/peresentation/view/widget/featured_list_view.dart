import 'package:bookly_app/core/utiles/router.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/peresentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly_app/features/home/peresentation/manager/featured_books_cubit/featured_states_state.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/books_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kBookDetailsView, extra: state.books[index]);
                  },
                  child: BooksImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail!,
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
