import 'dart:ui';

import 'package:flutter/material.dart';

Color mainBackgroundColour = Colors.lightBlue;

void main() {
  runApp(Frigo());
}

class Frigo extends StatelessWidget {
  static const String _applicationTitle = 'Frigo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _applicationTitle,
      theme: ThemeData(
        primarySwatch: mainBackgroundColour,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black54,
          displayColor: mainBackgroundColour,
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const String _homeString = 'Home';
  static const String _reservationsString = 'Reservations';
  static const String _chatString = 'Chat';
  static const String _archiveString = 'Archive';

  static const TextStyle selectedStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      _homeString,
      style: selectedStyle,
    ),
    Text(
      _reservationsString,
      style: selectedStyle,
    ),
    Text(
      _chatString,
      style: selectedStyle,
    ),
    Text(
      _archiveString,
      style: selectedStyle,
    ),
  ];

  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Empty Application bar on the top
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: _homeString,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: _reservationsString,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: _chatString,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: _archiveString,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),
    );
  }
}
