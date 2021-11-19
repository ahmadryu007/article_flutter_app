import 'package:articles_app/model/articles_response.dart';
import 'package:articles_app/repository/articles_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {

  ArticlesRepository repository;

  ArticlesCubit({
    required this.repository
  }) : super(ArticlesInitial());

  void loadArticles() async {
    try {
      emit(ArticlesLoading());
      final response = await repository.getArticles();
      emit(ArticlesLoaded(response: response));
    } on DioError catch (e) {
      emit(ArticlesFail(error: e.message));
    }
  }

}
