import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/core/shared/entity/user_entity.dart';
import 'package:godev/app/modules/login/domain/helpers/login_exceptions.dart';
import 'package:godev/app/modules/login/infra/datasource/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<AppExceptions, String>> call({required String email, required String password}) async{

    try{

      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        return Right('success');
      }

      throw LoginExceptions(message: 'Success', stackTrace: null);

    } catch(e,s){
      return Left(LoginExceptions(message: e.toString(),stackTrace: s));
    }


  }

}