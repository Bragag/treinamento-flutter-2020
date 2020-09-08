import 'package:exercicio_10/models/car-detail.model.dart';
import 'package:exercicio_10/utils/shared-preferens.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  static const routeName = '/favorites';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<CarDetail> _favorites = [];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    SharedPref sharedPref = SharedPref();

    try {
      print(await sharedPref.read('car'));
      CarDetail carDetail = CarDetail.fromJson(await sharedPref.read('car'));
      setState(() {
      });
    } catch (e) {
      // do something
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: _favorites.length == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mode_comment,
                      size: 36,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nenhum favorito cadastrado.',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                )
              : Container()),
    );
  }
}
