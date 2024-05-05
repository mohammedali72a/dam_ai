import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/repository/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_details_state.dart';

class ArticleDetailsCubit extends Cubit<ArticleDetailsState> {
  final _articleRepo = ArticleRepository.instance;
  final Article article;
  ArticleDetailsCubit(this.article) : super(ArticleDetailsInitial()) {
    _init();
  }
  _init() async {
    emit(ArticleDetailsLoadinInProgress());
    try {
      emit(ArticleDetailsLoadingSuccess(
          article: await _articleRepo.getArticle(articleId: article.id),
          similarArticles: await _articleRepo.getSimilarArticles(
              articleType: article.articleType)));
    } catch (e) {
      emit(ArticleDetailsLoadinInProgress());
    }
  }
}
