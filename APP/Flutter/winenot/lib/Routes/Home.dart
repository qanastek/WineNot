import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:winenot/Routes/Explore.dart';
import 'package:winenot/Routes/MyWines.dart';
import 'package:winenot/Routes/PreviewScreen.dart';
import 'package:winenot/Routes/TakePictureScreen.dart';
import 'package:winenot/Utils/MyColors.dart';

class Home extends StatefulWidget {

  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Current view index
  int _selectedIndex = 0;

  // Vues
  static const List<Widget> _widgetOptions = <Widget>[
    Explore(),
    MyWines(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // On tap menu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Take a picture of the wine
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // Floating button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _pictureWine,
        tooltip: 'Take a picture',
        child: Icon(Icons.camera_alt),
      ),

      // Nav bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: MyColors.settingsSecondary,
        notchMargin: 7,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: [

            // Explore btn
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.search
              ),
              title: Text("Explore"),
            ),

            // My wines btn
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