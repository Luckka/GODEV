import 'entity/user_entity.dart';

class UserDate {
  UserDate._();

  static final UserDate _instance = UserDate._();

  UserEntity? user;

  static UserDate get instance {
    return _instance;
  }

  ///Inicia os dados do usuario
  Future<void> initUserData({required UserEntity userEntity}) async {
    user = userEntity;
  }
}