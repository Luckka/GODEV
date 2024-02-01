import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';
import 'package:godev/app/modules/login/presenter/pages/login_page.dart';

class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<LoginBloc>((i) {
      return LoginBloc(
         LoginState(),

      );
    }),
  ];
  
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => LoginPage(loginBloc: Modular.get<LoginBloc>()))
  ];
}