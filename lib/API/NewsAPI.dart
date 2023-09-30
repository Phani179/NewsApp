import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../ModalClassess/News.dart';

void main()
{
  NewsAPI newsAPI = NewsAPI();
  newsAPI.getNews();
}

class NewsAPI
{
  static int totalResults = 0;
  static List<News> news = [];
  final dio = Dio();
  Future getNews() async
  {
    final responseDio = await dio.get("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=eedcd3d82f264460a16d8bc88938d3b0");
    final body = responseDio.data;
    totalResults = body["totalResults"];
    for(int i = 0; i < totalResults; i++)
      {
        news.add(News.fromMap(body["articles"][i]));
      }
    return news;
  }
}