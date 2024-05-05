import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/features/home/widgets/article_similar_card.dart';
import 'package:flutter/material.dart';

class SimilarSection extends StatelessWidget {
  final List<Article> articlesList;
  const SimilarSection({super.key, required this.articlesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "مشابه",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: articlesList.length,
              itemBuilder: (context, index) => ArticleSimilarCard(
                article: articlesList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
