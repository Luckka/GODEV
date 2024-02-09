import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/login/presenter/pages/login_page.dart';


class LoginModule extends Module{
  @override
  List<Bind<Object>> get binds => [


  ];



  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => const LoginPage()),

  ];
}