import 'package:godev/app/core/shared/entity/user_post_entity.dart';

class UserPostMapper extends UserPostEntity {
  UserPostMapper(
      {required super.datePublished,
        required super.description,
        required super.likes,
        required super.postId,
        required super.postImage,
        required super.postUrl,
        required super.uid, required super.username});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'datePublished': datePublished ?? '',
      'description': description ?? '',
       'likes': likes ?? '',
      'postId': postId ?? '',
      'postImage': postImage ?? '',
      'postUrl': postUrl ?? '',
      'uid': uid ?? '',
      'username': username ?? ''
    };
  }

  UserPostEntity fromMap(Map<String, dynamic> map) {
    return UserPostEntity(
        description: map['description'],
        uid: map["uid"],
        postId: map['postId'],
        datePublished: map['datePublished'],
        postUrl: map['postUrl'],
        postImage: map['postImage'], username: map['username'], likes: map['likes'],
       );
  }
}
