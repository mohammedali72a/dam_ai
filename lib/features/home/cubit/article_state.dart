part of 'article_cubit.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticlesLoadingInprogress extends ArticleState {}

class ArticleLoadingSuccess extends ArticleState {
  final List<Article> articlelist;
  final List<Article> discoverArticlelist;

  ArticleLoadingSuccess({
    required this.articlelist,
    required this.discoverArticlelist,
  });
}

class ArticleLoadingFail extends ArticleState {}

class AddArticleLoadingInProgress extends ArticleState {}

class AddArticleLoadingSuccess extends ArticleState {}

class AddArticleLoadingFail extends ArticleState {
  final String message;

  AddArticleLoadingFail({required this.message});
}
