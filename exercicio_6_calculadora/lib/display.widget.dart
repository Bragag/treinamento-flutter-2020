import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String value;

  const DisplayWidget({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Padding(
        padding: EdgeInsets.only(right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                this.value,
                style: TextStyle(
                  fontSize: 94,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}