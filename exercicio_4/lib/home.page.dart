import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final GlobalKey<ColorState> keyC1 = GlobalKey();
  static final GlobalKey<ColorState> keyC2 = GlobalKey();
  static final GlobalKey<ColorState> keyC3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          ColorWidget(
            key: keyC1,
            hexValue: '#d8cbc7',
          ),
          ColorWidget(
            key: keyC2,
            hexValue: '#9a6d00',
          ),
          ColorWidget(
            key: keyC3,
            hexValue: '#e2b4bd',
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: CupertinoButton(
                onPressed: () => this._onPress(),
                child: Container(
                  color: Colors.grey[400],
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Atualizar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPress() {
    keyC1.currentState.update();
    keyC2.currentState.update();
    keyC3.currentState.update();
  }
}
