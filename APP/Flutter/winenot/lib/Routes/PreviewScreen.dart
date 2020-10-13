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

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  PreviewScreen({this.imgPath, this.fileName});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  upload(File imageFile) async {

    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(Endpoints.sendImage());

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(imageFile.path)
    );

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
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
                                this.upload(File(widget.imgPath));
                                Navigator.pop(context);
                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WineInformation(
                                      wine: Wine(
                                        id: 70184,
                                        color: "Rouge",
                                        name: "Canicule",
                                        appellation: "Régnié",
                                        vintage: 2017,
                                        wineMaker: "Domaine Tano Péchard",
                                        region: "Gamay",
                                        price: 16.70,
                                        country: "France",
                                        label: "https://www.twil.fr/media/catalog/product/cache/1/image/1000x1000/a8c876702c6cb649fba7cbed6b6e2e91/0/0/00403fcd4106770fd0dd21f493df27f6.jpeg",
                                        description: "Cette cuvée 100% Gamay est issue d'une parcelle de vieilles vignes âgées de plus de 80 ans. Le vin est élevé 20 mois dans des fûts de chêne de l’Allier. C’est un vin très expressif avec une belle longueur en bouche. Une cuvée d’exception.",
                                      ),
                                    ))
                                );
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