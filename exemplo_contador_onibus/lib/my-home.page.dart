import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numberOfPeople = 0;

  _onIncrease() {
    setState(() {
      numberOfPeople++;
    });
  }

  _onDecrease() {
    setState(() {
      numberOfPeople--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contador de pessoas',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Número de pessoas no ônibus',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            numberOfPeople.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _onIncrease),
              CupertinoButton(
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _onDecrease),
            ],
          ),
        ],
      ),
    );
  }
}
