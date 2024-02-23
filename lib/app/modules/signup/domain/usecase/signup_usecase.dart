import 'dart:typed_data';

import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/core/shared/entity/user_entity.dart';

abstract interface class SignUpUseCase {

  Future<Either<AppExceptions,UserEntity>> call({
      required String user,
      required String password,
      required String email,
      required String bio,
      required Uint8List file,

    });
}