import 'package:bookly_app/core/utiles/app_styles.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/best_seller-list_view.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/custom_app_bar.dart';
import 'package:bookly_app/features/home/peresentation/view/widget/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomAppBar(),
            ),
            FeaturedBookListView(),
            SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Newest Books', style: Styles.textStyle18),
            ),
            SizedBox(height: 20),
          ],
        )),
        SliverToBoxAdapter(
          child: FeaturedBestSellerlistView(),
        ),
         
      ],
    );
  }
}
