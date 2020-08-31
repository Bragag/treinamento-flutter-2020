import 'package:exercicio_4/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorWidget extends StatefulWidget {
  ColorWidget({Key key, this.hexValue}) : super(key: key);
  String hexValue;

  @override
  ColorState createState() => ColorState();
}

class ColorState extends State<ColorWidget> {
  String _hexValue;
  TextEditingController _hexValueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hexValueController = TextEditingController(text: widget.hexValue);
    _hexValue = widget.hexValue;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Material(
          color: ColorUtils.fromHex(this._hexValue),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(7),
            ],
            controller: _hexValueController,
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 24,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  update() {
    setState(() {
      _hexValue = _hexValueController.text;
    });
  }
}
