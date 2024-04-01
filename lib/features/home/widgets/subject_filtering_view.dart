import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/data/repository/dummmy_data/dummy_data.dart';
import 'package:dam_ai/features/home/widgets/search_section.dart';
import 'package:flutter/material.dart';

class SubjectFilteringView extends StatelessWidget {
  static const route = "subjects";

  final ArticleType? articleType;
  const SubjectFilteringView({super.key, this.articleType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleType!.arabicValue),
      ),
      body: SingleChildScrollView(
        child: SearchSection(
          articlesList: dummyArticlesList,
        ),
      ),
    );
  }
}
