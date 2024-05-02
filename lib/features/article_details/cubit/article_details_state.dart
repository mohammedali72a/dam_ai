part of 'article_details_cubit.dart';

abstract class ArticleDetailsState {}

class ArticleDetailsInitial extends ArticleDetailsState {}

class ArticleDetailsLoadinInProgress extends ArticleDetailsState {}

class ArticleDetailsLoadingSuccess extends ArticleDetailsState {
  final Article article;
  final List<Article> similarArticles;

  ArticleDetailsLoadingSuccess({
    required this.article,
    required this.similarArticles,
  });
}

class ArticleDetailsLoadingFail extends ArticleDetailsState {}
