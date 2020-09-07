import 'package:exercicio_10/models/car-detail.model.dart';
import 'package:exercicio_10/pages/car-detail.page.dart';
import 'package:exercicio_10/pages/home.page.dart';
import 'package:exercicio_10/pages/brand-list.page.dart';
import 'package:exercicio_10/pages/model-list.page.dart';
import 'package:exercicio_10/pages/year-list.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        BrandListPage.routeName: (context) =>
            BrandListPage(ModalRoute.of(context).settings.arguments),
        ModelListPage.routeName: (context) =>
            ModelListPage(ModalRoute.of(context).settings.arguments),
        YearListPage.routeName: (context) =>
            YearListPage(ModalRoute.of(context).settings.arguments),
        CarDetailPage.routeName: (context) =>
            CarDetailPage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}