import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/ui/news.widget.dart';
import 'package:exercicio7start/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> _news = <News>[];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    _news = await Api.getNews(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: ColorUtils.mainColor,
      ),
      body: Container(
        color: ColorUtils.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var news = _news[index];
              return NewsWidget(
                title: news.title,
                category: news.category,
                description: news.description,
                image: news.image,
                url: news.url,
                author: news.author,
              );
            },
            itemCount: _news.length,
          ),
        ),
      ),
    );
  }
}
