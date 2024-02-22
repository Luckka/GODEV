import 'package:dart_either/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';

abstract interface class LoginDatasource {
  Future<Either<AppExceptions,void>> call({
      required String email,
      required String password
  });
}