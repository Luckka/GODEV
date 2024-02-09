import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';

import '../repository/signup_repository.dart';
import 'signup_usecase.dart';


class SignUpUseCaseImpl implements SignUpUseCase{
  final SignUpRepository signupRepository;

  SignUpUseCaseImpl({required this.signupRepository});

  @override
  Future<void> call({required String user, required String password, required String email, required String bio}) async{
     final result = await signupRepository.call(user: user, password: password, email: email, bio: bio,);

     return result;
  }

}