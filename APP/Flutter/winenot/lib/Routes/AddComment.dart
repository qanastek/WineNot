import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;
import 'dart:convert';

import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winenot/Models/Comment.dart';
import 'package:winenot/Models/Review.dart';
import 'package:winenot/Models/Wine.dart';
import 'package:winenot/Routes/NoWineFound.dart';
import 'package:winenot/Routes/WineInformations.dart';
import 'package:winenot/Utils/Endpoints.dart';
import 'package:winenot/Utils/MyColors.dart';

class AddComment extends StatefulWidget {

  final Wine wine;

  AddComment({this.wine});

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {

  final _commentFormKey = GlobalKey<FormState>();

  TextEditingController _content = TextEditingController();

  @override
  void initState() {
    super.initState();

  }
  // Send comment
  void _send(BuildContext ctx) async {

    // Check connection
    if (_commentFormKey.currentState.validate()) {

      print("ici");

      var body = json.encode({
        "content": _content.text,
        "createdAt": new DateTime.now().toString(),
        "lastEdit": new DateTime.now().toString(),
        "user_id": 135138680,
        "wine_id": widget.wine.id
      });

      print("la");

      // Send HTTP request to the server
      final http.Response response = await http.post(
          Endpoints.addComment(),
          headers: {"Content-Type": "application/json"},
          body: body
      );

      print("response");

      print("${response.statusCode}");
      print("${response.body}");

      // It's ok ?
      if (response.statusCode == 201) {

        // Navigate to the home
        Navigator.pop(ctx);
        Navigator.pop(ctx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Container(
          color: MyColors.loginBrandEnd,
          child: Padding(
            padding: EdgeInsets.only(
                top: 25,
                bottom: 25,
                left: 25,
                right: 25
            ),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[

               Form(
                 key: _commentFormKey,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[

                     // Identifiant
                     Container(
                       padding: EdgeInsets.only(
                           bottom: 25.0
                       ),
                       child: TextFormField(
                         controller: _content,
                         validator: (value) {
                           if (value.isEmpty) {
                             return 'Veuillez saisir le commentaire';
                           }
                           return null;
                         },
                         cursorColor: MyColors.loginCursor,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: MyColors.settingsPrimary,
                         ),
                         decoration: InputDecoration(
                             labelText: 'Contenu',
                             labelStyle: TextStyle(
                               color: MyColors.settingsSecondary,
                             ),
                             enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: MyColors.settingsPrimary),
                             ),
                             focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: MyColors.settingsPrimary),
                             ),
                             border: UnderlineInputBorder(
                               borderSide: BorderSide(color: MyColors.settingsPrimary),
                             ),
                         ),
                       ),
                     ),

                     // Login Button
                     Container(
                       padding: EdgeInsets.only(
                           top: 25.0
                       ),
                       child: RaisedButton(
                         elevation: 1,
                         color: MyColors.settingsSecondary,
                         padding: EdgeInsets.all(10.0),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50.0),
                         ),
                         onPressed: () {
                           _send(context);
                         },
                         child: Text(
                             "Add".toUpperCase(),
                             style: TextStyle(
                                 fontSize: 15,
                                 color: MyColors.loginButton,
                                 fontWeight: FontWeight.w800
                             )
                         ),
                       ),
                     ),

                   ],
                 ),
               ),

             ],
           ),
          ),
        )
    );
  }
}