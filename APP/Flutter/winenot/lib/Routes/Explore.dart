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

class Explore extends StatefulWidget {

  const Explore({
    Key key,
  }) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  // The wines themselves
  var wines = new List<Wine>();

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87);

  _getWines() {
    Endpoints.wines().then((response) {
      setState(() {

        print("response.body");
        print(response.body);

        Iterable list = json.decode(response.body);
        wines = list.map((model) => Wine.fromJson(model)).toList();

        print("wines");
        print(wines);
      });
    });
  }

  initState() {
    super.initState();
    _getWines();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Color(0xffF4F2EC),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          padding: const EdgeInsets.only(
            top: 20,
          ),
          children: List.generate(wines.length, (index) {
            return GestureDetector(
              onTap: () {

                print("salut");

                // Got to the wine description
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WineInformation(
                      wine: wines[index],
                    ))
                );

              },
              child: GridTile(
                child: Card(
                  // color: Color(0xffF8EFE5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  elevation: 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // Wine image
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            // Wine image from the web
                            Image.network(
                              "https://www.twil.fr/media/catalog/product/cache/1/image/1000x1000/a8c876702c6cb649fba7cbed6b6e2e91/0/0/00403fcd4106770fd0dd21f493df27f6.jpeg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.fitHeight,
                            ),

                          ],
                        ),
                      ),

                      /// Icon
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //     top: 20,
                      //     bottom: 10,
                      //   ),
                      //   decoration: new BoxDecoration(
                      //       color: Colors.white70,
                      //       borderRadius: new BorderRadius.all(Radius.circular(50))
                      //   ),
                      //   padding: const EdgeInsets.all(20),
                      //   child: Icon(
                      //     Icons.account_circle,
                      //     color: Colors.black87,
                      //     size: 25,
                      //   ),
                      // ),

                      /// Title
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 5,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            wines[index].appellation,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              shadows: [
                                Shadow(
                                  offset: Offset(1,1),
                                  blurRadius: 5,
                                  color: Color.fromARGB(50, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Description
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                              wines[index].region + ", " + wines[index].country + " " + wines[index].vintage.toString(),
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                              shadows: [
                                Shadow(
                                  offset: Offset(1,1),
                                  blurRadius: 5,
                                  color: Color.fromARGB(50, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
        ),
    );
  }
}