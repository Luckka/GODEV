import 'package:godev/app/core/shared/entity/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper(
      {required super.email,
        required super.photoUrl,
        required super.username,
        required super.bio,
        required super.followers,
        required super.following,
        required super.uid});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email ?? '',
      'photoUrl': photoUrl ?? '',
      'username': username ?? '',
      'bio': bio ?? '',
      'followers': followers ?? '',
      'following': following ?? '',
      'uid': uid ?? '',
    };
  }

  UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
        email: map['email'],
        uid: map['uid'],
        photoUrl: map['photoUrl'],
        username: map['username'],
        bio: map['bio'],
        followers: map['followers'],
        following: map['following']);
  }
}
