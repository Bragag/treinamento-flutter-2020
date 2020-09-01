import 'dart:convert';

import 'package:exercicio7start/models/news.model.dart';
import 'package:flutter/cupertino.dart';

class Api {
  static Future<List<News>> getNews(BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/feed_data.json');

    final dynamic data = JsonDecoder().convert(json);
    if (data is! Map) {
      throw ('Error');
    }

    List<News> news = [];

    data['news'].forEach((obj) {
      var modelledObj = News(
        title: obj['title'],
        description: obj['description'],
        category: obj['category'][0],
        url: obj['url'],
        image: obj['image'],
        author: obj['author'],
      );

      news.add(modelledObj);
    });

    return news;
  }
}
