import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winenot/Models/Wine.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Text(
                "Id: ${widget.wine.id}",
              ),

              Text(
                "name: ${widget.wine.name}",
              ),

              Text(
                "description: ${widget.wine.description}",
              ),

              Text(
                "color: ${widget.wine.color}",
              ),

              Text(
                "vintage: ${widget.wine.vintage}",
              ),

              Text(
                "wineMaker: ${widget.wine.wineMaker}",
              ),

              Text(
                "country: ${widget.wine.country}",
              ),

              Text(
                "region: ${widget.wine.region}",
              ),

              Text(
                "appellation: ${widget.wine.appellation}",
              ),

              Text(
                "price: ${widget.wine.price}",
              ),

              Image.network(
                widget.wine.label,
              ),

            ],
          ),
        ),
      ),
    );
  }
}