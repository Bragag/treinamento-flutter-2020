import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
final Function onPress;
final String buttonLabel;

  const ListItem({Key key, this.onPress, this.buttonLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      child: Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
        padding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          buttonLabel,
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
