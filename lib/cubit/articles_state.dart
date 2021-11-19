part of 'articles_cubit.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<ArticlesResponse> response;
  ArticlesLoaded({
    required this.response
  });
}

class ArticlesLoading extends ArticlesState {} 

class ArticlesFail extends ArticlesState {
  final String error;

  ArticlesFail({
    required this.error
  });

}
