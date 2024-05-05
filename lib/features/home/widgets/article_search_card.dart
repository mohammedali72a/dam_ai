import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/features/article_details/presntation/article_details.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleSearchCard extends StatelessWidget {
  final Article article;
  const ArticleSearchCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArticleDetails(
            article: article,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FancyShimmerImage(
                  width: 120,
                  height: 120,
                  imageUrl: article.images.first,
                ),
              ),
              Expanded(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  minVerticalPadding: 0,
                  title: Text(
                    article.title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.white.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            article.articleType.arabicValue,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          DateFormat.yMMMEd("ar_EG").format(article.datePosted),
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
