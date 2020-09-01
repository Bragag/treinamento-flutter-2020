import 'package:exercicio7start/ui/detail.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String title, description, category, url, image, author;

  const NewsWidget({
    Key key,
    this.title,
    this.description,
    this.category,
    this.url,
    this.image,
    this.author,
  }) : super(key: key);

  _onPress(BuildContext context) {
    Navigator.pushNamed(
      context,
      DetailPage.routeName,
      arguments: DetailPageArguments(
        this.author,
        this.url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onPress(context);
      },
      child: Container(
        height: 340,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image(
                  image: NetworkImage(this.image),
                  height: 190,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 12,
                  ),
                  child: Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromARGB(100, 0, 118, 255),
                    ),
                    child: Center(
                      child: Text(
                        this.category,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              color: Color(0xFF595151),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                  right: 6,
                  top: 15,
                  bottom: 15,
                ),
                child: Column(
                  children: [
                    Text(
                      this.title,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      this.description,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
