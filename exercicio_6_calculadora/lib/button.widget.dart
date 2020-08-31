import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String value;
  final Function onPress;
  final Color bgColor;

  const ButtonWidget({Key key, this.value, this.onPress, this.bgColor}) : super(key: key);

  TextStyle getTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: this.value == '0'
          ? MediaQuery.of(context).size.width * 0.50
          : MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.25,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        color: this.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: onPress,
        child: Text(
          this.value,
          style: getTextStyle(),
        ),
      ),
    );
  }
}