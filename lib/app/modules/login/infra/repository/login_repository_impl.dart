import 'package:dart_either/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/login/domain/repository/login_repository.dart';
import 'package:godev/app/modules/login/infra/datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository{
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});
  @override
  Future<Either<AppExceptions, void>> call({required String email, required String password}) async{
    final result = await  loginDatasource.call(email: email, password: password);

    return result;
  }

}