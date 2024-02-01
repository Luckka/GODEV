import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/login/domain/repository/login_repository.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase.dart';

class LoginUseCasaImpl implements LoginUseCase{
  final LoginRepository loginRepository;

  LoginUseCasaImpl({required this.loginRepository});

  @override
  Future<void> call({required String user, required String password, required String email, required String bio}) async{
     final result = await loginRepository.call(user: user, password: password, email: email, bio: bio,);

     return result;
  }

}