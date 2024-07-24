import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/peresentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBestSellerlistView extends StatelessWidget {
  const FeaturedBestSellerlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 30),
            itemBuilder: (context, index) => BestSellerListViewItem(state.books[index]),
          );
        } else if (state is BestSellerFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
