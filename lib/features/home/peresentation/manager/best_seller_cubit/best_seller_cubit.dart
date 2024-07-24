import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerLoading());

    var response = await homeRepo.fetchBestSellerBooks();
    response.fold(
      (failure) => emit(BestSellerFailure(failure.errorMessage)),
      (books) => emit(BestSellerSuccess(books)),
    );
  }
}
