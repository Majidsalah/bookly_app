import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class IntialFeaturedBook extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  const FeaturedBookFailure(this.errorMessage);

  final String errorMessage;
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;
  const FeaturedBookSuccess(this.books);
}
