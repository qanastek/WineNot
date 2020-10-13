import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FailedConnexion {

  static void show(BuildContext ctx) async {

    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Problème de connexion !"),
          content: new Text("Identifiants incorrect !"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fermer"),
              onPressed: () {
                // Close
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }

}