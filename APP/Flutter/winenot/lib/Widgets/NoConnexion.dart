import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class NoConnexion {

  static void show(BuildContext ctx) async {

    var connectivityResult = await (Connectivity().checkConnectivity());

    // Check if the connection is ok
    if (connectivityResult == ConnectivityResult.none) {

      showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Aucune connexion internet trouver !"),
            content: new Text("Veuillez vous connecter à internet."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Fermer"),
                onPressed: () {
                  // Close
                  Navigator.of(context).pop();

                  // Check again
                  NoConnexion.show(ctx);
                },
              ),
            ],
          );
        },
      );
    }

  }

}