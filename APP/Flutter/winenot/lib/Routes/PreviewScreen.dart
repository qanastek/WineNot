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
import 'package:winenot/Models/Wine.dart';
import 'package:winenot/Routes/NoWineFound.dart';
import 'package:winenot/Routes/WineInformations.dart';
import 'package:winenot/Utils/Endpoints.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  PreviewScreen({this.imgPath, this.fileName});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  // Upload the picture to the server
  upload(String imageFile, BuildContext ctx) async {

    File img = File(imageFile);
    final bytes = img.readAsBytesSync();
    var img64 = base64Encode(bytes);

    print("img64");
    print(img64);

    print("body");
    var body = json.encode({
      "img": "$img64"
    });

    // Send HTTP request to the server
    print("response to " + Endpoints.sendScan());
    final http.Response response = await http.post(
        Endpoints.sendScan(),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print(response);

    print("after response");
    print("${response.statusCode}");

    Navigator.pop(ctx);
    Navigator.pop(ctx);

    // If founded
    if(response.statusCode == 200) {

      print("${response.body}");

      // Move to the wine view
      Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => WineInformation(
            wine: Wine.fromJson(jsonDecode(response.body)),
          ))
      );
    } else {

      print("-----------------------------------------------------------------------");

      // Move to no wine found
      Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => NoWineFound())
      );
    }
  }

  Future getBytes () async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.black,
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          RaisedButton(
                            color: Color(0xFF333F4D),
                            // icon: Icon(
                            //   Icons.delete_forever,
                            //   color: Colors.white,
                            // ),
                            child: Text(
                              "Start again",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              // Go back
                              Navigator.pop(context);
                            },
                          ),

                          RaisedButton(
                            color: Color(0xFF9F1640),
                            // icon: Icon(
                            //   Icons.save,
                            //   color: Colors.white,
                            // ),
                            child: Text(
                              "Use the photo",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              getBytes().then((bytes) {
                                print('here now');
                                print(widget.imgPath);
                                // var img = Image.file(File(widget.imgPath));
                                // print(img);
                                this.upload(widget.imgPath, context);
                              });
                            },
                          ),

                        ],
                      )
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}