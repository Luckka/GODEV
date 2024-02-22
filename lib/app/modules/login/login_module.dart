import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase_impl.dart';
import 'package:godev/app/modules/login/external/login_datasource_impl.dart';
import 'package:godev/app/modules/login/infra/repository/login_repository_impl.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';
import 'package:godev/app/modules/login/presenter/pages/login_page.dart';


class LoginModule extends Module{
  @override
  List<Bind<Object>> get binds => [

    Bind.lazySingleton<LoginBloc>((i) => LoginBloc(SignInState(), loginUseCase: i())),
    Bind.lazySingleton<LoginUseCaseImpl>((i) => LoginUseCaseImpl(loginRepository: i())),
    Bind.lazySingleton<LoginRepositoryImpl>((i) => LoginRepositoryImpl(loginDatasource: i())),
    Bind.lazySingleton<LoginDatasourceImpl>((i) => LoginDatasourceImpl()),

  ];



  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => LoginPage()),

  ];
}