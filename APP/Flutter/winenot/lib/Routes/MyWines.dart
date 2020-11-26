import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winenot/Models/Wine.dart';
import 'package:winenot/Routes/WineInformations.dart';
import 'package:winenot/Utils/Endpoints.dart';

class MyWines extends StatefulWidget {



  const MyWines({
    Key key,
  }) : super(key: key);

  @override
  _MyWinesState createState() => _MyWinesState();
}

class _MyWinesState extends State<MyWines> {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Text(
          'Hello, My Wines',
          style: optionStyle,
        )
    );
  }
}