import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:newsapp/data/news_data.dart';
import 'package:newsapp/models/news_model/news_model.dart';
class FetchNews {
  var client= http.Client();
  var language = 'en';
  var phrase= 'World';
  var category = 'Technology';
  FetchNews(this.language, this.phrase, this.category);

   Future<List<Article>> fetchNews() async {
    final response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$phrase&from=2024-10-14&sortBy=publishedAt&apiKey=402772dc132b431bb295122210072483'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      NewsDart.li.clear();
      // List<Article> articles = [];
      for(var news in json['articles']){
        var article = Article.fromJson(news);
        print(article.title);
        NewsDart.li.add(article);
      }
      print(NewsDart.li.length);
      return NewsDart.li;
    } else {
      return [];
      throw Exception('Failed to load news');

    }
  }
}