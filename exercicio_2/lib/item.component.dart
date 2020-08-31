import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final String title, message;

  Item({this.icon, this.bgColor, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height:80,
        margin: EdgeInsets.only(
          bottom: 15,
        ),
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: this.bgColor,
                    ),
                    child: Icon(
                      this.icon,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.title,
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                        Flexible(
                          child: Text(
                            this.message,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
