
import 'dart:typed_data';

import 'package:dart_either/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';

abstract interface class SignUpDatasource {

  Future<Either<AppExceptions,void>> call({
    required String user,
    required String password,
    required String email,
    required String bio,
    required Uint8List file


  });
}