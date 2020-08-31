import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'crypto-card.component.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  void _onPlusButtonPressed() {
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF413E65),
        title: Text(
          'Current Portfolio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF413E65),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 55,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'BALANCE',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0x80FFFFFF),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    '\$103221323',
                    style: TextStyle(
                      fontSize: 34,
                      color: Color(0x80FFFFFF),
                    ),
                  ),
                  Text(
                    '.59',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11),
              Row(
                children: [
                  Text(
                    '+28,20%',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF2AF598),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0x80FFFFFF),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Your Coins',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: _onPlusButtonPressed,
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 60,
                        color: Color(0xFF2AF598),
                      ),
                    ),
                  ),
                ],
              ),
              CryptoCard(
                bgColor: Color(0xFFF5317F),
                fullName: 'Bitcoin',
                shortName: 'BTC',
                value: 6730.49,
                count: '6.20',
              ),
              CryptoCard(
                bgColor: Color(0xFF8739E5),
                fullName: 'Ethereum',
                shortName: 'ETH',
                value: 490.26,
                count: '18.05',
              ),
              CryptoCard(
                bgColor: Color(0xFFE53636),
                fullName: 'Litecoin',
                shortName: 'LTC',
                value: 130.31,
                count: '51.80',
              ),
              CryptoCard(
                bgColor: Color(0xFF7DBD28),
                fullName: 'XRP',
                shortName: 'Ripple',
                value: 0.49,
                count: '819k',
              )
            ],
          ),
        ),
      ),
    );
  }
}
