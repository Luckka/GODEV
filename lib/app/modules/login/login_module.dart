import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';
import 'package:godev/app/modules/login/presenter/pages/login_page.dart';
import 'package:godev/app/modules/login/presenter/pages/sign_up_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<LoginBloc>((i) {
      return LoginBloc(
         LoginState(), loginUseCase: i(),

      );
    }),
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => LoginPage(loginBloc: Modular.get<LoginBloc>())),
    ChildRoute(AppRoutes.signup, child: (args,context) => SignUpPage(loginBloc: Modular.get<LoginBloc>()))
  ];
}