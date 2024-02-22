import 'package:dart_either/src/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/login/domain/repository/login_repository.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase{
  final LoginRepository loginRepository;

  LoginUseCaseImpl({required this.loginRepository});
  @override
  Future<Either<AppExceptions, void>> call({required String email, required String password}) async{
     final result = await loginRepository.call(email: email, password: password);
     return result;
  }

}