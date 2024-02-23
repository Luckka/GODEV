import 'package:godev/app/core/shared/entity/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper(
      {String? email,
      String? photoUrl,
      String? username,
      String? bio,
      List<dynamic>? followers,
      List<dynamic>? following,
      String? uid})
      : super(
            email: email ?? '',
            uid: uid ?? '',
            photoUrl: photoUrl ?? '',
            username: username ?? '',
            bio: bio ?? '',
            followers: followers ?? [],
            following: following ?? []);

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
