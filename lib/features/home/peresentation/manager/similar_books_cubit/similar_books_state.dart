part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

class IntialSimilarBook extends SimilarBooksState {}

class SimilarBookLoading extends SimilarBooksState {}

class SimilarBookFailure extends SimilarBooksState {
  const SimilarBookFailure(this.errorMessage);

  final String errorMessage;
}

class SimilarBookSuccess extends SimilarBooksState {
  final List<BookModel> books;
  const SimilarBookSuccess(this.books);
}
