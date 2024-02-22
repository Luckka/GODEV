import 'package:godev/app/core/shared/entity/user_entity.dart';

class UserMapper{

  UserMapper._();

  static Map<String,dynamic> toMap(UserEntity user){
    return <String,dynamic> {
      'email': user.email,
      'photoUrl': user.photoUrl,
      'username': user.username,
      'bio': user.bio,
      'followers': user.followers,
      'following': user.following,
      'uid': user.uid,
    };
  }

}