import 'package:exercicio_10/pages/brand-list.page.dart';
import 'package:exercicio_10/pages/favorites.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _onPress(BuildContext context, String type, String title) {
    Navigator.pushNamed(
      context,
      BrandListPage.routeName,
      arguments: BrandListPageArguments(
        type,
        title,
      ),
    );
  }

  _onPressNavBarButton() {
    Navigator.pushNamed(context, FavoritesPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIPE Table'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => _onPressNavBarButton(),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => _onPress(context, 'carros', 'Cars'),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cars',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.commute,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => _onPress(context, 'motos', 'Motorcycles'),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Motorcycles',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.commute,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () => _onPress(context, 'caminhoes', 'Trucks'),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Trucks',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.commute,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
