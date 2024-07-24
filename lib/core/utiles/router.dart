import 'package:bookly_app/core/utiles/setup_service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/peresentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/peresentation/view/book_details_view.dart';
import 'package:bookly_app/features/home/peresentation/view/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/view/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kSearchView = '/searchView';
  static String kHomeView = '/homeView';
  static String kBookDetailsView = '/bookDetailsView';
  static String kSplashView = '/';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              books: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return const SearchView();
        },
      ),
    ],
  );
}
