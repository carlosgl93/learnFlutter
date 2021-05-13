import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  final yellow = Color(0xffe9c46a); // font color
  final orange = Color(0xfff4a261); // CTA color
  final red = Color(0xffe76f51); // background color

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Tasks'),
    Text('Index 2: Projects'),
    Text('Index 3: Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.info_rounded),
              onPressed: () {
                return print('Made by Carlos Gumucio');
              },
            )
          ],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: const Color(0xffe76f51),
          centerTitle: true,
          foregroundColor: const Color(0xfff4a261),
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: red),
            child: CircleAvatar(
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png')),
          )
        ])),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffe76f51),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: red,
          selectedIconTheme: IconThemeData(
            color: red,
          ),
          unselectedItemColor: yellow,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child:
                  Text('This box will show a summary of the projects created'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text('This box will show stats of the tasks done/to do'),
            ),
          ],
        ));
  }
}
