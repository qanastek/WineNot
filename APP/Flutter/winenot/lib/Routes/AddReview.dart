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

class AddReview extends StatefulWidget {

  final Wine wine;

  AddReview({this.wine});

  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {

  final _reviewFormKey = GlobalKey<FormState>();

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _stars = TextEditingController();

  @override
  void initState() {
    super.initState();

  }
  // Send comment
  void _send(BuildContext ctx) async {

    // Check connection
    if (_reviewFormKey.currentState.validate()) {

      print("ici");

      var body = json.encode({
        "name": _title.text,
        "description": _description.text,
        "stars": _stars.text,
        "createdAt": new DateTime.now().toString(),
        "lastEdit": new DateTime.now().toString(),
        "user_id": 227792459,
        "wine_id": widget.wine.id
      });

      print("la");

      // Send HTTP request to the server
      final http.Response response = await http.post(
          Endpoints.addReview(),
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
                 key: _reviewFormKey,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[

                     // Title
                     Container(
                       padding: EdgeInsets.only(
                           bottom: 25.0
                       ),
                       child: TextFormField(
                         controller: _title,
                         validator: (value) {
                           if (value.isEmpty) {
                             return 'Veuillez saisir le titre';
                           }
                           return null;
                         },
                         cursorColor: MyColors.loginCursor,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: MyColors.settingsPrimary,
                         ),
                         decoration: InputDecoration(
                             labelText: 'Titre',
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

                     // Description
                     Container(
                       padding: EdgeInsets.only(
                           bottom: 25.0
                       ),
                       child: TextFormField(
                         controller: _description,
                         validator: (value) {
                           if (value.isEmpty) {
                             return 'Veuillez saisir la description';
                           }
                           return null;
                         },
                         cursorColor: MyColors.loginCursor,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: MyColors.settingsPrimary,
                         ),
                         decoration: InputDecoration(
                           labelText: 'Description',
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

                     // Stars
                     Container(
                       padding: EdgeInsets.only(
                           bottom: 25.0
                       ),
                       child: TextFormField(
                         controller: _stars,
                         keyboardType: TextInputType.number,
                         validator: (value) {
                           if (value.isEmpty) {
                             return "Veuillez saisir le nombre d'étoiles";
                           }
                           if (int.parse(value) < 0 || int.parse(value) > 5) {
                             return "Veuillez saisir le nombre d'étoiles entre 0 et 5";
                           }
                           return null;
                         },
                         cursorColor: MyColors.loginCursor,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: MyColors.settingsPrimary,
                         ),
                         decoration: InputDecoration(
                           labelText: "Nombre d'étoiles",
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