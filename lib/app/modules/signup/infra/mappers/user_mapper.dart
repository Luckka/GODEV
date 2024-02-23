import 'package:godev/app/core/shared/entity/user_entity.dart';

class UserMapper {
  final String email;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final String uid;

  UserMapper(
      {required this.email,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following,
      required this.uid});

   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'photoUrl': photoUrl,
      'username': username,
      'bio': bio,
      'followers': followers,
      'following': following,
      'uid': uid,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
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
