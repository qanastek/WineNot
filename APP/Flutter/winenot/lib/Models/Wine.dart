import 'package:flutter/cupertino.dart';

class Wine {

  const Wine({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.color,
    @required this.vintage,
    @required this.wineMaker,
    @required this.country,
    @required this.region,
    @required this.appellation,
    @required this.price,
    @required this.label,
  });

  final int id;
  final String name;
  final String description;
  final String color;
  final int vintage;
  final String wineMaker;
  final String country;
  final String region;
  final String appellation;
  final double price;
  final String label;

}