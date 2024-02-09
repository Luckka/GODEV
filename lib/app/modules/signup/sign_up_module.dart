import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/signup/domain/usecase/signup_usecase_impl.dart';
import 'package:godev/app/modules/signup/external/signup_datasource_impl.dart';
import 'package:godev/app/modules/signup/infra/reposiitory/signup_repository_impl.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_bloc.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_state.dart';
import 'package:godev/app/modules/login/presenter/pages/login_page.dart';
import 'package:godev/app/modules/signup/presenter/pages/sign_up_page.dart';

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<SignUpBloc>((i) => SignUpBloc(SignUpState(), signUpUseCase: i())),
    Bind.lazySingleton<SignUpUseCaseImpl>((i) => SignUpUseCaseImpl(signupRepository: i())),
    Bind.lazySingleton<SignUpRepositoryImpl>((i) => SignUpRepositoryImpl(signUpDatasource: i())),
    Bind.lazySingleton<SignUpDatasourceImpl>((i) => SignUpDatasourceImpl()),

  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => SignUpPage())
  ];
}