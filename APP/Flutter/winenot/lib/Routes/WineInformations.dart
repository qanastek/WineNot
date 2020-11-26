import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winenot/Models/Wine.dart';
import 'package:winenot/Utils/MyColors.dart';

class WineInformation extends StatefulWidget {

  const WineInformation({
    Key key,
    @required this.wine,
  }) : super(key: key);

  final Wine wine;

  @override
  WineInformationState createState() => WineInformationState();
}

class WineInformationState extends State<WineInformation> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<List<String>> items =  [
      [ "Colour:", widget.wine.color.toString() ],
      [ "Region:", widget.wine.region.toString() ],
      [ "Country:", widget.wine.country.toString() ],
      [ "Price:", widget.wine.price.toString() + " €" ],
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              // Wine image
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // Wine image from the web
                    Image.network(
                      widget.wine.label,
                      height: 300,
                      width: 300,
                      fit: BoxFit.fitHeight,
                    ),

                  ],
                ),
              ),

              // Rounded background
              Container(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: new BoxDecoration(
                    color: MyColors.settingsSecondary,
                      // color: Color(0xffC2552B),
                      // color: Color(0xffF2526C),
                      // color: Color(0xff9f141d),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      // Name of the wine
                      Container(
                        width: 300.0,
                        child: Text(
                          "${widget.wine.appellation} ${widget.wine.vintage} ${widget.wine.wineMaker}",
                          style: TextStyle(
                            // color: Color(0xFF252438),
                            color: Color(0xffF9F6F6),
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      // Stars
                      Padding(
                        padding: EdgeInsets.only(
                            top: 7,
                        ),
                        child: Row(
                          children: [

                            Text(
                              "4,5 ",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffF9F6F6),
                              ),
                            ),

                            Icon(
                              Icons.star,
                              color: Color(0xffF8CE2E),
                            ),

                            Icon(
                              Icons.star,
                              color: Color(0xffF8CE2E),
                            ),

                            Icon(
                              Icons.star,
                              color: Color(0xffF8CE2E),
                            ),

                            Icon(
                              Icons.star_half,
                              color: Color(0xffF8CE2E),
                            ),

                          ],
                        ),
                      ),

                      // Ratings
                      Padding(
                        padding: EdgeInsets.only(
                          top: 4,
                          bottom: 10,
                        ),
                        child: Text(
                          "125 Ratings",
                          style: TextStyle(
                            color: Color(0xffECECEE),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // Description
                      Text(
                        "${widget.wine.description}",
                        style: TextStyle(
                          color: Color(0xffECECEE),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),

                      // Stats & Food Matching title
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Stats & Food Matching",
                          style: TextStyle(
                            color: Color(0xffECECEE),
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      // The statistics
                      Column(
                        children: items.map((i) => Container(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                i[0],
                                style: TextStyle(
                                  color: Color(0xffECECEE),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                i[1],
                                style: TextStyle(
                                  color: Color(0xffECECEE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )).toList(),
                      ),

                      // Text(
                      //   "vintage: ${widget.wine.vintage}",
                      // ),

                      // Text(
                      //   "wineMaker: ${widget.wine.wineMaker}",
                      // ),

                      // Text(
                      //   "country: ${widget.wine.country}",
                      // ),
                      //
                      // Text(
                      //   "region: ${widget.wine.region}",
                      // ),

                      // Text(
                      //   "Name: ${widget.wine.name}",
                      // ),
                      //
                      // Text(
                      //   "price: ${widget.wine.price}",
                      // ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}