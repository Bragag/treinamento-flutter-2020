import 'package:exercicio_9/ui/pages/pic-of-the-day.page.dart';
import 'package:exercicio_9/ui/pages/search.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Searchpage(),
    PicOfTheDayPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Paw City'),
        backgroundColor: Colors.blue,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search for breed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Pic of the day',
          ),
        ],
      ),
    );
  }
}
