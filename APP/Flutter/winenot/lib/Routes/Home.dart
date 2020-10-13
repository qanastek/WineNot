import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:winenot/Routes/PreviewScreen.dart';
import 'package:winenot/Routes/TakePictureScreen.dart';

class Home extends StatefulWidget {

  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _pictureWine() {

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TakePictureScreen())
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _pictureWine,
        tooltip: 'Take a picture',
        child: Icon(Icons.camera_alt),
      ),


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 7,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: [

            BottomNavigationBarItem(
              icon: Icon(
                  Icons.search
              ),
              title: Text("Explore"),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person
              ),
              title: Text("My wines"),
            ),

          ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
        ),
      ),

    );
  }
}