import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homerepo) : super(SimilarBooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBookLoading());
    var response = await homerepo.fetchSimilarBooks(category: category);

    response.fold(
      (failure) => emit(SimilarBookFailure(failure.errorMessage)),
      (books) => emit(SimilarBookSuccess(books)),
    );
  }
}
