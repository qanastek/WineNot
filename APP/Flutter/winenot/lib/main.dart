import 'package:flutter/material.dart';
import 'package:winenot/Routes/Login.dart';
import 'package:winenot/Utils/MyColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    MaterialColor color = new MaterialColor(0xffa4373e, MyColors.colorCodes);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}
