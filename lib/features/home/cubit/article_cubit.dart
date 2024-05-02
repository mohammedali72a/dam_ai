import 'dart:async';
import 'dart:io';

import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/data/repository/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final _articleRepo = ArticleRepository.instance;
  ArticleCubit() : super(ArticleInitial()) {
    intial();
  }
  Future intial() async {
    emit(ArticlesLoadingInprogress());
    try {
      emit(ArticleLoadingSuccess(
        articlelist: await _articleRepo.getAllArticles(),
        discoverArticlelist: await _articleRepo.getDiscoverArticles(),
      ));
    } catch (e) {
      emit(ArticleLoadingFail());
    }
  }

  Future addArtiicle({
    required String title,
    required List<String> youtubeUrl,
    required String content,
    required bool isHeader,
    required List<File> images,
    required ArticleType articleType,
  }) async {
    emit(AddArticleLoadingInProgress());
    try {
      await _articleRepo.createArticle(
        title: title,
        youtubeUrl: youtubeUrl,
        content: content,
        images: images,
        articleType: articleType,
        isHeader: isHeader,
      );
      emit(AddArticleLoadingSuccess());
    } catch (e) {
      emit(AddArticleLoadingFail(message: e.toString()));
    }
  }
}
