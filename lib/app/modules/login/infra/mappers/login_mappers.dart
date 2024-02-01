//
// import 'package:godev/app/modules/login/domain/helpers/login_mapper_exception.dart';
//
// class LoginMapper{
//   LoginMapper._();
//
//
//   static Map<String,dynamic> toMap(LoginEntity login) {
//     return <String,dynamic>{
//         'id' : login.id,
//         'username': login.username,
//         'bio': login.bio,
//         'email': login.email
//     };
//   }
//
//   static LoginEntity fromMap(Map<String,dynamic> map){
//     try{
//
//       return LoginEntity(username: map['username'], email: map['email'], bio: map['bio'], id: map['id']);
//
//     }on LoginMapperException{
//       rethrow;
//
//     }catch(e,strackTrace){
//       throw LoginMapperException(message: 'Login Mapper Exception: $e', stackTrace: strackTrace);
//     }
//   }
// }