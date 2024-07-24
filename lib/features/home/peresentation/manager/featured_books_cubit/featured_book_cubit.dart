import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:bookly_app/features/home/peresentation/manager/featured_books_cubit/featured_states_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(IntialFeaturedBook());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var response = await homeRepo.fetchFeaturedBooks();
    response.fold(
      (failure) => emit(FeaturedBookFailure(failure.errorMessage)),
      (books) => emit(FeaturedBookSuccess(books)),
    );
  }
}
