import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/signup/sign_up_module.dart';

import 'modules/login/login_module.dart';
import 'modules/signup/domain/usecase/signup_usecase_impl.dart';
import 'modules/signup/external/signup_datasource_impl.dart';
import 'modules/signup/infra/reposiitory/signup_repository_impl.dart';
import 'modules/signup/presenter/bloc/signup_bloc.dart';
import 'modules/signup/presenter/bloc/signup_state.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [

    Bind.lazySingleton<SignUpBloc>((i) => SignUpBloc(i(), signUpUseCase: i())),
    Bind.lazySingleton<SignUpUseCaseImpl>((i) => SignUpUseCaseImpl(signupRepository: i())),
    Bind.lazySingleton<SignUpRepositoryImpl>((i) => SignUpRepositoryImpl(signUpDatasource: i())),
    Bind.lazySingleton<SignUpDatasourceImpl>((i) => SignUpDatasourceImpl()),

  ];


  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(AppRoutes.signup, module: SignUpModule()),

  ];
}