import 'package:dart_either/dart_either.dart';

import '../../../../core/shared/app_exceptions.dart';

abstract interface class LoginUseCase{
  Future<Either<AppExceptions,void>> call({
    required String email,
    required String password
  });
}