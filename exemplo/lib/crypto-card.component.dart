import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  CryptoCard(
      {this.bgColor, this.fullName, this.shortName, this.value, this.count});

  final Color bgColor;
  final String fullName, shortName, count;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.8),
        color: this.bgColor,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.0),
              color: Color(0x40FFFFFF),
            ),
            child: Center(
              child: Text(
                this.fullName[0],
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    this.shortName,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.fullName,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0x80FFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$${this.value}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            this.count,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Color(0x20000000),
                  offset: Offset(0, 2),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
