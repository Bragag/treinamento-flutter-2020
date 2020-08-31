import 'package:exercicio_2/item.component.dart';
import 'package:flutter/material.dart';

class PostcardPage extends StatelessWidget {
  PostcardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postcard'),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: null,
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Item(
              icon: Icons.person,
              bgColor: Colors.pink,
              title: 'Recipient',
              message: 'Amelie N Mason',
            ),
            Item(
              icon: Icons.business,
              bgColor: Colors.amber,
              title: 'Address',
              message:
                  'Av. Theodomiro Porto da Fonseca, 3101 - Cristo Rei, São Leopoldo - RS, 93022-715',
            ),
            Item(
              icon: Icons.edit,
              bgColor: Colors.lightBlue,
              title: 'Recipient',
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SAVE DRAFT',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.grey,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'REVIEW DESIGN',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
