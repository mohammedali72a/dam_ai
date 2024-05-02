import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/features/home/widgets/search_section.dart';
import 'package:flutter/material.dart';

class SubjectFilteringView extends StatelessWidget {
  static const route = "subjects";
  final List<Article> articleList;

  final ArticleType? articleType;
  const SubjectFilteringView(
      {super.key, this.articleType, required this.articleList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleType!.arabicValue),
      ),
      body: SingleChildScrollView(
        child: DiscoverSection(
          articlesList: articleList.where((element) {
            if (articleType != null) {
              return element.articleType == articleType!;
            }
            return true;
          }).toList(),
        ),
      ),
    );
  }
}
