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
  final String price;
  final String label;

  Wine.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        color = json['wine_color_id'].toString(),
        vintage = json['vintage'],
        wineMaker = json['wine_maker_id'].toString(),
        country = json['country'],
        region = json['region'],
        appellation = json['appellation'],
        price = json['price'],
        label = json['label']
  ;

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'wine_color_id': color,
      'vintage': vintage,
      'wineMaker': wineMaker,
      'country': country,
      'region': region,
      'appellation': appellation,
      'price': price,
      'label': label
    };
  }

}