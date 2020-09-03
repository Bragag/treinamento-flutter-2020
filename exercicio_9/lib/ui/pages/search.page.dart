import 'package:exercicio_9/models/dog.model.dart';
import 'package:exercicio_9/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController _inputController = TextEditingController();
  Dog _dog;

  _onButtonPress() async {
    _dog = await Api.getDog(_inputController.text);
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
              Text(
                'Type the breed you want to see',
              ),
              TextFormField(
                controller: _inputController,
              ),
              SizedBox(height: 10,),
              if(_dog != null) ...[
                Image.network(_dog.image),
              ],
              CupertinoButton(
                child: Text('Search'),
                onPressed: _onButtonPress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
