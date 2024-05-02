import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/data/repository/transform_to_map.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ArticleRepository {
  static final instance = ArticleRepository();
  final _articlesImagesSource = FirebaseStorage.instance.ref("articles-images");
  final _articlesSource = FirebaseFirestore.instance.collection("articles");
  Future<Article> getArticle({required String articleId}) async {
    final articleDoc = await _articlesSource.doc(articleId).get();
    final dataMap = transformDocToMap(articleDoc);
    return Article.fromJson(dataMap);
  }

  Future<List<Article>> getArticles() async {
    final snapshot = await _articlesSource.limit(10).get();

    final postDocs = snapshot.docs;
    final articles = <Article>[];

    for (final doc in postDocs) {
      try {
        final dataMap = transformDocToMap(doc);
        articles.add(Article.fromJson(dataMap));
      } catch (e) {
        log(e.toString());
      }
    }

    return articles;
  }

  Future<List<Article>> getSimilarArticles(
      {required ArticleType articleType}) async {
    final snapshot = await _articlesSource
        .where("articleType", isEqualTo: articleType.value)
        .limit(10)
        .get();

    final postDocs = snapshot.docs;
    final articles = <Article>[];

    for (final doc in postDocs) {
      try {
        final dataMap = transformDocToMap(doc);
        articles.add(Article.fromJson(dataMap));
      } catch (e) {
        log(e.toString());
      }
    }

    return articles;
  }

  Future<List<Article>> getAllArticles() async {
    final snapshot = await _articlesSource.limit(10).get();

    final articleDocs = snapshot.docs;
    final articless = <Article>[];

    for (final doc in articleDocs) {
      try {
        final dataMap = transformDocToMap(doc);
        articless.add(Article.fromJson(dataMap));
      } catch (e) {
        log(e.toString());
      }
    }

    return articless..shuffle();
  }

  Future<List<Article>> getDiscoverArticles() async {
    final snapshot = await _articlesSource
        .limit(10)
        .where("isHeader", isEqualTo: true)
        .get();

    final articleDocs = snapshot.docs;
    final articless = <Article>[];

    for (final doc in articleDocs) {
      try {
        final dataMap = transformDocToMap(doc);
        articless.add(Article.fromJson(dataMap));
      } catch (e) {
        log(e.toString());
      }
    }

    return articless..shuffle();
  }

  Future<String> createArticle({
    required String title,
    required List<String> youtubeUrl,
    required String content,
    required bool isHeader,
    required List<File> images,
    required ArticleType articleType,
  }) async {
    final List<String> imageUrls = [];
    for (final image in images) {
      final pictureData = image.readAsBytesSync();
      final snapshot = await _articlesImagesSource
          .child("/${const Uuid().v4()}")
          .putData(pictureData);
      final url = await snapshot.ref.getDownloadURL();
      imageUrls.add(url);
    }

    final postData = Article(
      id: '',
      articleType: articleType,
      content: content,
      images: imageUrls,
      title: title,
      youtubeUrl: youtubeUrl,
      datePosted: DateTime.now(),
      isHeader: isHeader,
    ).toJson();

    DocumentReference postRef = await _articlesSource.add(postData);
    postRef.update({"id": postRef.id});

    return postRef.id;
  }
}
