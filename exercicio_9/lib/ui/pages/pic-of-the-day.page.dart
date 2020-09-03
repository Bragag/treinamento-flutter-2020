import 'package:exercicio_9/models/dog.model.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicOfTheDayPage extends StatefulWidget {
  @override
  _PicOfTheDayPageState createState() => _PicOfTheDayPageState();
}

class _PicOfTheDayPageState extends State<PicOfTheDayPage> {
  Dog _dog;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _requestFeaturedDog();
  }

  _requestFeaturedDog() async {
    _dog = await Api.getFeaturedDog();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dog == null
                  ? CupertinoActivityIndicator()
                  : Image.network(_dog.image),
            ],
          ),
        ),
      ),
    );
  }
}
