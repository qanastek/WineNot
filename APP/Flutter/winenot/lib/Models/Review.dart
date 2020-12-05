import 'package:flutter/cupertino.dart';

class Review {

  const Review({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.stars,
    @required this.created_at,
    @required this.updated_at
  });

  final int id;
  final String name;
  final String description;
  final int stars;
  final String created_at;
  final String updated_at;

  Review.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        stars = json['stars'],
        created_at = json['created_at'],
        updated_at = json['updated_at']
  ;

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stars': stars,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

}