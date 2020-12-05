import 'package:flutter/cupertino.dart';

class Comment {

  const Comment({
    @required this.id,
    @required this.content,
    @required this.created_at,
    @required this.updated_at
  });

  final int id;
  final String content;
  final String created_at;
  final String updated_at;

  Comment.fromJson(Map json)
      : id = json['id'],
        content = json['content'],
        created_at = json['created_at'],
        updated_at = json['updated_at']
  ;

  Map toJson() {
    return {
      'id': id,
      'content': content,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

}