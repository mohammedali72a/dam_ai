import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/features/home/widgets/subject_filtering_view.dart';
import 'package:dam_ai/features/home/widgets/asubjects_card.dart';
import 'package:flutter/material.dart';

class SubjectsSection extends StatelessWidget {
  final List<Article> articleList;

  const SubjectsSection({super.key, required this.articleList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "موضوعات",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SubjectsCard(
                  title: "جامعة دمياط",
                  image: "assets/images/DU-university.jpg",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubjectFilteringView(
                          articleType: ArticleType.duUniversity,
                          articleList: articleList,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SubjectsCard(
                  title: "التربية والتعليم والتعليم العالى",
                  image: "assets/images/e-ai.jpeg",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubjectFilteringView(
                          articleList: articleList,
                          articleType: ArticleType.education,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SubjectsCard(
                  title: "الصحة",
                  image: "assets/images/medicine.jpg",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubjectFilteringView(
                          articleType: ArticleType.medicine,
                          articleList: articleList,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SubjectsCard(
                  title: "مبادرة حياة كريمة",
                  image: "assets/images/life.jpg",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubjectFilteringView(
                          articleList: articleList,
                          articleType: ArticleType.fairLife,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
