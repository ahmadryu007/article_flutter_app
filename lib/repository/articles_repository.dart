import 'dart:convert';

import 'package:articles_app/config/config.dart';
import 'package:articles_app/model/articles_response.dart';
import 'package:dio/dio.dart';

class ArticlesRepository {
  Dio dio = Dio();
  Response? response;

  Future<List<ArticlesResponse>> getArticles() async {
    
    response = await dio.get(articlesUrl);
    return articlesResponseFromJson(json.encode(response?.data));
  }

}