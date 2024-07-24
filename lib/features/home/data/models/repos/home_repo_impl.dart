import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService api;

  HomeRepoImpl(this.api);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await api.get(
          endPoint:
              'volumes?&q=''');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await api.get(endPoint: 'volumes?&q= Ahmaed khaled tawfik+Hanan lasheen');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data =
          await api.get(endPoint: 'volumes?&Sorting=relevance&q=$category ');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure(e.toString()));
    }
  }
}
