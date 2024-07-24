import 'package:bookly_app/core/utiles/constans.dart';
import 'package:bookly_app/core/utiles/router.dart';
import 'package:bookly_app/core/utiles/setup_service_locator.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/peresentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly_app/features/home/peresentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSellerCubit(getIt.get<HomeRepoImpl>())..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
