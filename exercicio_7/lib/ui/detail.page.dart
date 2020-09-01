import 'package:exercicio7start/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPageArguments {
  final String title, url;

  DetailPageArguments(this.title, this.url);
}

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';
  final DetailPageArguments args;

  DetailPage(this.args);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
        backgroundColor: ColorUtils.mainColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: WebView(
          initialUrl: widget.args.url,
        ),
      ),
    );
  }
}
