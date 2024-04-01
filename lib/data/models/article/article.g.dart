// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      articleType: $enumDecode(_$ArticleTypeEnumMap, json['articleType']),
      datePosted: DateTime.parse(json['datePosted'] as String),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'articleType': _$ArticleTypeEnumMap[instance.articleType]!,
      'datePosted': instance.datePosted.toIso8601String(),
    };

const _$ArticleTypeEnumMap = {
  ArticleType.education: 'education',
  ArticleType.duUniversity: 'duUniversity',
  ArticleType.fairLife: 'fairLife',
  ArticleType.medicine: 'medicine',
};
