import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String id;
  final String title;
  final String content;
  final List<String> images;
  final ArticleType articleType;
  final DateTime datePosted;
  const Article({
    required this.id,
    required this.title,
    required this.content,
    required this.images,
    required this.articleType,
    required this.datePosted,
  });
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
